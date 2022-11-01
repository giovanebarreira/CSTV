//
//  MatchesListViewModel.swift
//  CSTV
//
//  Created by Giovane Barreira on 31/10/22.
//

import Foundation

protocol MatchesListViewModelOutput {
    var matchesList: [Match] { get }
    var delegate: MatchesListDelegate? { get set }
    func fetchData(page: Int)
}

protocol MatchesListDelegate: AnyObject {
    func displayMatchesList()
    func showSpinner(_ isLoading: Bool)
    func didFail(error: String)
}

final class MatchesListViewModel: MatchesListViewModelOutput {
    var matchesList: [Match] = []
    private let matchesListService: MatchesListNetworking
    //   private let teamDetailsService: TeamDetailsNetworking
    weak var delegate: MatchesListDelegate?

    init(matchesListService: MatchesListNetworking) {
        self.matchesListService = matchesListService
        //  self.teamDetailsService = teamDetailsService
    }

    func fetchData(page: Int) {
        fetchMatchesList(page: page) { [weak self] listResult in
            self?.matchesList = listResult ?? []
        }
    }

    func fetchMatchesList(page: Int = 1, completion: @escaping ([Match]?) -> Void) {
        delegate?.showSpinner(true)
        matchesListService.fetchMatches(page: page) { [weak self] result in
            switch result {
            case .success(let matches):
                completion(matches)

            case .failure(let error):
                self?.delegate?.didFail(error: error.localizedDescription)
                completion(nil)
            }
            self?.delegate?.showSpinner(false)
        }
    }
}
