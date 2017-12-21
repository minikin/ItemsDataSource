//
//  SupplementaryDescriptor.swift
//  RPonSB
//
//  Created by Sasha Prokhorenko on 07.12.17.
//  Copyright © 2017 Sasha Prokhorenko. All rights reserved.
//

import UIKit

public struct SupplementaryDescriptor {
	
	public let supplementaryClass: UICollectionReusableView.Type
	public let reuseIdentifier: String
	public let configure: (UICollectionReusableView) -> ()
	
	public init<SupplementaryView: UICollectionReusableView>(reuseIdentifier: String,
																										configure: @escaping (SupplementaryView) -> ()) {
		self.supplementaryClass = SupplementaryView.self
		self.reuseIdentifier = reuseIdentifier
		self.configure = { supplementaryView in
			configure(supplementaryView as! SupplementaryView)
		}
	}
}
