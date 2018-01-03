//
//  ItemsDataSource.swift
//  ItemsDataSource
//
//  Created by Sasha Prokhorenko on 06.12.17.
//  Copyright © 2017 Sasha Prokhorenko. All rights reserved.
//

import UIKit

open class ItemsDataSource: NSObject, UICollectionViewDataSource {
	
	// MARK: - Instance Properties
	public var sections: [Groupable]?
	public var items: [Itemable]?
	public let supplementaryDescriptor: ((Groupable) -> SupplementaryDescriptor)?
	public let cellDescriptor: (Itemable) -> CellDescriptor
	
	// MARK: - Object lifecycle
	public init(sections: [Groupable],
			 supplementaryDescriptor:  @escaping (Groupable) -> SupplementaryDescriptor,
			 cellDescriptor: @escaping (Itemable) -> CellDescriptor) {
		
		self.supplementaryDescriptor = supplementaryDescriptor
		self.cellDescriptor = cellDescriptor
		self.sections = sections
		self.items = nil
	}
	
	public init(items: [Itemable],
			 cellDescriptor: @escaping (Itemable) -> CellDescriptor) {
		
		self.sections = nil
		self.supplementaryDescriptor = nil
		self.items = items
		self.cellDescriptor = cellDescriptor
	}
	
	// MARK: - UICollectionViewDataSource
	public func numberOfSections(in collectionView: UICollectionView) -> Int {
		if let sections = self.sections {
			return sections.count
		} else {
			return 1
		}
	}
	
	public func collectionView(_ collectionView: UICollectionView,
											numberOfItemsInSection section: Int) -> Int {
		if let sections = self.sections {
			return sections[section].items.count
		} else {
			return items?.count ?? 0
		}
	}
	
	public func collectionView(_ collectionView: UICollectionView,
											cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		
		if let sections = self.sections {
			let item = sections[indexPath.section].items[indexPath.row]
			let descriptor = cellDescriptor(item)
			let cell = collectionView.dequeueReusableCell(withReuseIdentifier: descriptor.reuseIdentifier, for: indexPath)
			descriptor.configure(cell)
			return cell
		} else {
			guard let realItems = items else {
				return UICollectionViewCell()
			}
			let item = realItems[indexPath.row]
			let descriptor = cellDescriptor(item)
			let cell = collectionView.dequeueReusableCell(withReuseIdentifier: descriptor.reuseIdentifier, for: indexPath)
			descriptor.configure(cell)
			return cell
		}
	}
	
	public func collectionView(_ collectionView: UICollectionView,
											viewForSupplementaryElementOfKind kind: String,
											at indexPath: IndexPath) -> UICollectionReusableView {
		switch kind {
			case UICollectionElementKindSectionHeader:
				if let sections = self.sections {
					let section = sections[indexPath.section]
					guard let headerDescriptor = supplementaryDescriptor else {
						return UICollectionReusableView()
					}
					let descriptor = headerDescriptor(section)
					let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind,
																																					 withReuseIdentifier: descriptor.reuseIdentifier,
																																					 for: indexPath)
					descriptor.configure(headerView)
					return headerView
				} else {
					return UICollectionReusableView()
			}
		default:
			return UICollectionReusableView()
		}
	}
	
}
