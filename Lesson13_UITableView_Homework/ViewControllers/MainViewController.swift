//
//  MainViewController.swift
//  Lesson13_UITableView_Homework
//
//  Created by Valery Zvonarev on 12.02.2026.
//

import UIKit

final class MainViewController: UIViewController {

    // MARK: - Properties
    private var cellViewModel = CellViewModel()

    private let myTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()

    // MARK: - Subviews

    // MARK: - Lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupViewProperties()
        setupSubviews()
        setupConstraints()
    }

    // MARK: - Layout
    private func setupViewProperties(){
        view.backgroundColor = .systemGray2
    }

    private func setupSubviews(){
        myTableView.dataSource = self
        myTableView.delegate = self
        myTableView.register(CustomCellView.self, forCellReuseIdentifier: CustomCellView.reuseIdentifier)
        view.addSubview(myTableView)
    }

    private func setupConstraints(){
        NSLayoutConstraint.activate([
            myTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            myTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            myTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            myTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }

    //    @objc private func didTapButton(){
    //    }
}

extension MainViewController: UITableViewDataSource {

//    func numberOfSections(in tableView: UITableView) -> Int {
//        cellViewModel.tableGroups.count
//    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        cellViewModel.tableContent.count
//        cellViewModel.tableGroups[section].cellModels.count
    }

//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        cellViewModel.tableGroups[section].
//    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CustomCellView.reuseIdentifier, for: indexPath) as? CustomCellView else {
            return UITableViewCell()
        }

        cell.configure(with: cellViewModel.tableContent[indexPath.row])
        return cell
    }
}

extension MainViewController: UITableViewDelegate {

}

#Preview {
    MainViewController()
}


