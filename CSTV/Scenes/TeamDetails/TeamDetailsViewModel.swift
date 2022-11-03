//
//  TeamDetailsViewModel.swift
//  CSTV
//
//  Created by Giovane Barreira on 02/11/22.
//

import Foundation

protocol TeamDetailsViewModelOutput {
    func fetchTeamsData()
    var teamDetailsDisplay: TeamDetailsDisplay? { get }
    var delegate: TeamDetailsDelegate? { get set }
}

protocol TeamDetailsDelegate: AnyObject {
    func showSpinner(_ isLoading: Bool)
    func didFail(error: String)
    func displayTeams()
}

final class TeamDetailsViewModel: TeamDetailsViewModelOutput {
    weak var delegate: TeamDetailsDelegate?
    private let service: TeamDetailsNetworking
    private let selectedMatch: MatchesListDisplay
    var teamDetailsDisplay: TeamDetailsDisplay?

    init(service: TeamDetailsNetworking, selectedMatch: MatchesListDisplay) {
        self.service = service
        self.selectedMatch = selectedMatch
    }

    func fetchTeamsData() {
        let group = DispatchGroup()
        var team1: [Player]?
        var team2: [Player]?

        guard let slugTeam1 = selectedMatch.competitors.first?.opponent.slug else { return }
        guard let slugTeam2 = selectedMatch.competitors.last?.opponent.slug else { return }

        fetchTeam1Details(slug: slugTeam1, group: group, completion: { team1 = $0?.first?.players ?? [] })
        fetchTeam2Details(slug: slugTeam2, group: group, completion: { team2 = $0?.last?.players ?? [] })

        group.notify(queue: .global(qos: .background)) {
            self.teamDetailsDisplay = TeamDetailsDisplay(selectedMatch: self.selectedMatch, team1: team1, team2: team2)
            self.delegate?.displayTeams()
        }
    }

    func fetchTeam1Details(slug: String, group: DispatchGroup, completion: @escaping ([TeamDetails]?) -> Void) {
        group.enter()
        delegate?.showSpinner(true)
        service.fetchTeamDetails(teamSlug: slug) { [weak self] result in
            switch result {
            case .success(let team):
                completion(team)

            case .failure(let error):
                self?.delegate?.didFail(error: error.localizedDescription)
                completion(nil)
            }
            self?.delegate?.showSpinner(false)
            group.leave()
        }
    }

    func fetchTeam2Details(slug: String, group: DispatchGroup, completion: @escaping ([TeamDetails]?) -> Void) {
        group.enter()
        service.fetchTeamDetails(teamSlug: slug) { [weak self] result in
            switch result {
            case .success(let team):
                completion(team)

            case .failure(let error):
                self?.delegate?.didFail(error: error.localizedDescription)
                completion(nil)
            }
            group.leave()
        }
    }
}
