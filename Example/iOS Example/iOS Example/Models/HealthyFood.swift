//
//  HealthyFood.swift
//  iOS Example
//
//  Created by Sasha Prokhorenko on 21.12.17.
//  Copyright © 2017 Sasha Prokhorenko. All rights reserved.
//

import ItemsDataSource

struct HealthyFood: Groupable {
	let name: String
	var items: [Itemable]
	var supplementaryDescriptor: SupplementaryDescriptor? {
		get {
			return SupplementaryDescriptor(reuseIdentifier: ReuseIdentifier.healthyFoodHeader,
																		 configure: self.configureHealthyFoodpHeader)
		}
	}
}

extension HealthyFood {
	func configureHealthyFoodpHeader(_ header: HealthyFoodHeader) {
		header.headerLabel.text = name
	}
}
