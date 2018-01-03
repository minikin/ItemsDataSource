//
//  MainViewController.swift
//  iOS Example
//
//  Created by Sasha Prokhorenko on 18.12.17.
//  Copyright © 2017 Sasha Prokhorenko. All rights reserved.
//

import UIKit
import ItemsDataSource

final class MainViewController: UIViewController {
	
	// MARK: - Injections
	public var healthyDataSourse = ItemsDataSource(sections: [HealthyGroup](),
																										 supplementaryDescriptor: {$0.supplementaryDescriptor!},
																										 cellDescriptor: { $0.itemCellDescriptor })
	
	// MARK: - Instance Properties
	@IBOutlet weak var mainCollectionView: UICollectionView! {
		didSet {
			healthyDataSourse.sections = healthyFood
			let layout = CommonFlowLayout(columns: 1,
																		itemHeight: 60,
																		inset: 5,
																		spacing: 5,
																		lineSpacing: 10)
			mainCollectionView.collectionViewLayout = layout
			mainCollectionView.dataSource = healthyDataSourse
			mainCollectionView.reloadData()
		}
	}
	
	// MARK: - ViewController LifeCycle
	override func viewDidLoad() {
		super.viewDidLoad()

	}
	
	


}
