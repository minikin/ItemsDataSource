//
//  Vitamin.swift
//  iOS Example
//
//  Created by Sasha Prokhorenko on 21.12.17.
//  Copyright © 2017 Sasha Prokhorenko. All rights reserved.
//
import UIKit
import ItemsDataSource

struct Vitamin {
	// MARK: - Instance Properties
	let name: String
	let ammount: Double
}

extension Vitamin {
	func configureIngredientCell(_ cell: ViataminCell) {
		cell.vitaminNameLabel.text = name
		cell.backgroundColor = UIColor.randomColor()
	}
}


extension Vitamin: Itemable {
	var itemCellDescriptor: CellDescriptor {
		get {
			return CellDescriptor(reuseIdentifier: ReuseIdentifier.vitaminCell, configure: self.configureIngredientCell)
		}
	}
}

	// MARK: - Conform to Comparable
extension Vitamin: Comparable {
	static func <(lhs: Vitamin, rhs: Vitamin) -> Bool {
		return lhs.name == rhs.name
	}
	
	static func ==(lhs: Vitamin, rhs: Vitamin) -> Bool {
		return lhs.name == rhs.name
	}
}
