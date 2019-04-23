//
//  HealthyFood.swift
//  iOS Example
//
//  Created by Sasha Prokhorenko on 21.12.17.
//  Copyright © 2017 Sasha Prokhorenko. All rights reserved.
//

import ItemsDataSource
import UIKit

struct HealthyFood {
    // MARK: - Instance Properties

    let type: HealthyType
    let name: String
    let calories: String
    let fat: String
    let protein: String
    let carbohydrate: String
    let vitamins: [Vitamin]
}

extension HealthyFood {
    func configureHealthyFoodCell(_ cell: HealthyFoodCell) {
        cell.healthyModel = self
        cell.cellLabel.text = name
        cell.contentView.backgroundColor = UIColor.randomColor()
    }
}

extension HealthyFood: Itemable {
    var itemCellDescriptor: CellDescriptor {
        return CellDescriptor(reuseIdentifier: ReuseIdentifier.healthyFoodCell,
                              configure: configureHealthyFoodCell)
    }
}

extension HealthyFood: Comparable {
    static func < (lhs: HealthyFood, rhs: HealthyFood) -> Bool {
        return lhs.name == rhs.name
    }

    static func == (lhs: HealthyFood, rhs: HealthyFood) -> Bool {
        return lhs.name == rhs.name
    }
}
