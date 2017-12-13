//
//  Groupable.swift
//  RPonSB
//
//  Created by Sasha Prokhorenko on 07.12.17.
//  Copyright © 2017 Sasha Prokhorenko. All rights reserved.
//

protocol Groupable {
	var items: [Itemable] {get}
	var supplementaryDescriptor: SupplementaryDescriptor? {get}
}
