//
//  SupplementaryDescriptor.swift
//  RPonSB
//
//  Created by Sasha Prokhorenko on 07.12.17.
//  Copyright © 2017 Sasha Prokhorenko. All rights reserved.
//

import UIKit

struct SupplementaryDescriptor {
	
	let supplementaryClass: UICollectionReusableView.Type
	let reuseIdentifier: String
	let configure: (UICollectionReusableView) -> ()
	
	init<SupplementaryView: UICollectionReusableView>(reuseIdentifier: String,
																										configure: @escaping (SupplementaryView) -> ()) {
		self.supplementaryClass = SupplementaryView.self
		self.reuseIdentifier = reuseIdentifier
		self.configure = { supplementaryView in
			configure(supplementaryView as! SupplementaryView)
		}
	}
}
