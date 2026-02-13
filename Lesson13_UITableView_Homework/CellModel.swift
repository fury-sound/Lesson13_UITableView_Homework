//
//  CellModel.swift
//  Lesson13_UITableView_Homework
//
//  Created by Valery Zvonarev on 12.02.2026.
//

import UIKit

struct CellModel {
    let title: String
    let subtitle: String
    let imageName: String
    let cellBackgroundColor: UIColor
}

struct GroupCellModel {
    let groupTitle: String
    let cellModels: [CellModel]
}
