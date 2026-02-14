//
//  CellViewModel.swift
//  Lesson13_UITableView_Homework
//
//  Created by Valery Zvonarev on 12.02.2026.
//

import UIKit

class CellViewModel {
    let tableContent = [
        CellModel(title: "Title 1", subtitle: "Subtitle 1", imageName: "person.circle", cellBackgroundColor: .white),
        CellModel(title: "Title 2", subtitle: "Subtitle 2", imageName: "person.fill", cellBackgroundColor: .green),
        CellModel(title: "Title 3", subtitle: "Subtitle 3", imageName: "person.2.fill", cellBackgroundColor: .gray),
        CellModel(title: "Title 4", subtitle: "Subtitle 4", imageName: "person", cellBackgroundColor: .yellow)
    ]

    lazy var tableGroups = [
        GroupCellModel(groupTitle: "Group 1", cellModels: tableContent),
        GroupCellModel(groupTitle: "Group 2", cellModels: tableContent),
        GroupCellModel(groupTitle: "Group 3", cellModels: tableContent)
    ]

}
