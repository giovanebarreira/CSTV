//
//  ViewController.swift
//  CSTV
//
//  Created by Giovane Barreira on 30/10/22.
//

import UIKit

final class MatchesListViewController: UIViewController {
    var coordinatorDelegate: MatchesListCoordinated?
    private var viewModel: MatchesListViewModelOutput
    private var tableView = UITableView()
    private var isFetchingData: Bool = false
    private var currentPage: Int = 1

    init(viewModel: MatchesListViewModelOutput) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        title = "Partidas"
        view.backgroundColor = .background
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        viewModel.delegate = self
        viewModel.fetchData(page: currentPage)        
    }

    func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(MatchesListCell.self, forCellReuseIdentifier: MatchesListCell.reuseId)

        tableView.separatorStyle = .none
        tableView.backgroundColor = .background
        tableView.rowHeight = MatchesListCell.estimatedRowHeight
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)

        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

extension MatchesListViewController: MatchesListDelegate {
    private func alertCallBack() {
        self.viewModel.fetchData(page: self.currentPage)
    }

    func displayMatchesList() {
        if isFetchingData {
            isFetchingData = false
        }

        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }

    func showSpinner(_ isLoading: Bool) {
        DispatchQueue.main.async {
            if !self.isFetchingData {
                isLoading ? self.showSpinner() : self.removeSpinner()
            }
        }
    }

    func didFail(error: String) {
        DispatchQueue.main.async {
            self.showAlert(errorMessage: error, callback: self.alertCallBack)
        }
    }
}

extension MatchesListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.matchesList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MatchesListCell.reuseId, for: indexPath) as? MatchesListCell else { return UITableViewCell() }

        let matchResult = viewModel.matchesList[indexPath.row]
        cell.configure(match: matchResult)
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      tableView.deselectRow(at: indexPath, animated: true)
      let selectedMatch = viewModel.matchesList[indexPath.row]
        coordinatorDelegate?.goToMatchDetails(competitors: selectedMatch.competitors)
    }
}

extension MatchesListViewController: UIScrollViewDelegate {
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        if isFetchingData {
            self.tableView.tableFooterView = spinnerFooter()
        }

        let offsetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
        let seventyPercenteOfContentHeight = contentHeight * 0.7

        if offsetY > seventyPercenteOfContentHeight {
            if !isFetchingData {
                beginBatchFetch()
            }
        }
    }

    func beginBatchFetch() {
        currentPage += 1
        isFetchingData = true
        viewModel.fetchData(page: currentPage)
    }
}

