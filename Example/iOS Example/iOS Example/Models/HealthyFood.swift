//
//  HealthyFood.swift
//  iOS Example
//
//  Created by Sasha Prokhorenko on 21.12.17.
//  Copyright © 2017 Sasha Prokhorenko. All rights reserved.
//

import ItemsDataSource

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
		cell.cellLabel.text = name
		cell.contentView.backgroundColor = .lightGray
	}
}


extension HealthyFood: Itemable {
	var itemCellDescriptor: CellDescriptor {
		get {
			return CellDescriptor(reuseIdentifier: ReuseIdentifier.healthyFoodCell,
														configure: self.configureHealthyFoodCell)
		}
	}
}
