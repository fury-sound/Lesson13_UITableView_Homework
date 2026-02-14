//
//  MainViewControllerForSections.swift
//  Lesson13_UITableView_Homework
//
//  Created by Valery Zvonarev on 13.02.2026.
//

import UIKit

final class MainViewControllerForSections: UIViewController {

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

    private func makeHeader(with section: Int) -> UIView {
        let headerView = UIView()
        headerView.backgroundColor = .systemGray6

        let label = UILabel()
        label.text = cellViewModel.tableGroups[section].groupTitle
        label.font = .systemFont(ofSize: 22, weight: .bold)
        label.textColor = .systemRed
        label.translatesAutoresizingMaskIntoConstraints = false

        headerView.addSubview(label)

        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 10),
            label.centerYAnchor.constraint(equalTo: headerView.centerYAnchor)
        ])

        return headerView
    }

    private func makeFooter(with section: Int) -> UIView {
        let footerView = UIView()
        footerView.backgroundColor = .systemMint

        let label = UILabel()
        label.text = "Cекция: \(section + 1). Элементов: \(cellViewModel.tableGroups[section].cellModels.count)"
        label.font = .systemFont(ofSize: 14, weight: .bold)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false

        footerView.addSubview(label)

        NSLayoutConstraint.activate([
            label.trailingAnchor.constraint(equalTo: footerView.trailingAnchor, constant: -10),
            label.centerYAnchor.constraint(equalTo: footerView.centerYAnchor)
        ])

        return footerView
    }

    //    @objc private func didTapButton(){
    //    }
}

extension MainViewControllerForSections: UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        cellViewModel.tableGroups.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //        cellViewModel.tableContent.count
        cellViewModel.tableGroups[section].cellModels.count
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        cellViewModel.tableGroups[section].groupTitle
    }

    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        return "Section Footer"
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CustomCellView.reuseIdentifier, for: indexPath) as? CustomCellView else {
            return UITableViewCell()
        }

        cell.configure(with: cellViewModel.tableContent[indexPath.row])
        return cell
    }
}

extension MainViewControllerForSections: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//  анимация тапа по ячейке при заданном кастомном фоне. Видно, если отключить переход на другой вью ниже
        guard let cell = tableView.cellForRow(at: indexPath) as? CustomCellView else { return }

        UIView.animate(withDuration: 0.7, animations: {
            cell.cellBGColor = .systemRed.withAlphaComponent(0.5)
        }) { _ in
            UIView.animate(withDuration: 0.7) {
                cell.cellBGColor = cell.tempColor
            }
        }
        tableView.deselectRow(at: indexPath, animated: true)

        //  переход на SecondViewController
        let section = cellViewModel.tableGroups[indexPath.section]
        let items = section.cellModels[indexPath.row]
        let newVC = SecondViewController(titleString: items.title, subTitleString: items.subtitle, iconString: items.imageName)
            navigationController?.pushViewController(newVC, animated: true)
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return makeHeader(with: section)
    }

    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return makeFooter(with: section)
    }

}

#Preview {
    MainViewControllerForSections()
}


