//
//  ViewController.swift
//  CSTV
//
//  Created by Giovane Barreira on 30/10/22.
//

import UIKit

final class MatchesListViewController: UIViewController {
    private var viewModel: MatchesListViewModelOutput
    private var tableView = UITableView()
    private var isFetchingData: Bool = false
    private var currentPage: Int = 1

    init(viewModel: MatchesListViewModelOutput) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        title = "Partidas"
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate = self
        viewModel.fetchData(page: currentPage)
    }

    func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self

        tableView.register(MatchesListCell.self, forCellReuseIdentifier: MatchesListCell.reuseId)
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

    }

    func showSpinner(_ isLoading: Bool) {

    }

    func didFail(error: String) {
        DispatchQueue.main.async {
          self.showAlert(errorMessage: error, callback: self.alertCallBack)
        }
    }
}

extension MatchesListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
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

