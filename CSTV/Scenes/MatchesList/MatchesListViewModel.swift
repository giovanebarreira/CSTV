//
//  MatchesListViewModel.swift
//  CSTV
//
//  Created by Giovane Barreira on 31/10/22.
//

import Foundation

protocol MatchesListViewModelOutput {
    var matchesList: [MatchesListDisplay] { get }
    var delegate: MatchesListDelegate? { get set }
    func fetchData(page: Int)
}

protocol MatchesListDelegate: AnyObject {
    func displayMatchesList()
    func showSpinner(_ isLoading: Bool)
    func didFail(error: String)
}

final class MatchesListViewModel: MatchesListViewModelOutput {
    var matchesList: [MatchesListDisplay] = []
    private let matchesListService: MatchesListNetworking
    weak var delegate: MatchesListDelegate?

    init(matchesListService: MatchesListNetworking) {
        self.matchesListService = matchesListService
    }

    func fetchData(page: Int) {
        fetchMatchesList(page: page) { [weak self] listResult in
            guard let listResult = listResult else { return }
            listResult.forEach { match in
                self?.matchesList.append(MatchesListDisplay(match: match))
            }
            self?.delegate?.displayMatchesList()
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
