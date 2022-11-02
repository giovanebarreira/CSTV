//
//  TeamDetailsViewModel.swift
//  CSTV
//
//  Created by Giovane Barreira on 02/11/22.
//

import Foundation

protocol TeamDetailsViewModelOutput {
    func fetchTeamDetails(slug: String)
    var teams: [TeamDetails] { get }
    var delegate: TeamDetailsDelegate? { get set }
}

protocol TeamDetailsDelegate: AnyObject {
    func displayTeams()
    func showSpinner(_ isLoading: Bool)
    func didFail(error: String)
}

final class TeamDetailsViewModel: TeamDetailsViewModelOutput {
    weak var delegate: TeamDetailsDelegate?
    private let service: TeamDetailsService
    private let competitors: [Competitors]
    var teams: [TeamDetails] = []

    init(service: TeamDetailsService, competitors: [Competitors]) {
        self.service = service
        self.competitors = competitors
    }

//    func fetchTeamsData() {
//        let group = DispatchGroup()
//        var team1: [TeamDetails]?
//        var team2: [TeamDetails]?
//        guard let slugTeam1 = competitors.first?.opponent.slug else { return }
//        guard let slugTeam2 = competitors.last?.opponent.slug else { return }
//
//        fetchTeamDetails(slug: slugTeam1, group: group, completion: { team1 = $0 ?? [] })
//        fetchTeamDetails(slug: slugTeam2, group: group, completion: { team2 = $0 ?? [] })
//
//        group.notify(queue: .global(qos: .background)) {
//            self.teams.append(team1)
//            self.teams.append(team2)
//        }
//    }

    //, group: DispatchGroup, completion: @escaping ([TeamDetails]?) -> Void

    func fetchTeamDetails(slug: String) {
     //   group.enter()
        delegate?.showSpinner(true)
        service.fetchTeamDetails(teamSlug: slug) { [weak self] result in
            switch result {
            case .success(let team):
                print(team)
           //     completion(team)

            case .failure(let error):
                self?.delegate?.didFail(error: error.localizedDescription)
              //  completion(nil)
            }
            self?.delegate?.showSpinner(false)
         //   group.leave()
        }
    }
}
