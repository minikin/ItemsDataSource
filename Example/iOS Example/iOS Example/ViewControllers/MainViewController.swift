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
			mainCollectionView.dataSource = healthyDataSourse
			let layout = CommonFlowLayout(columns: 1,
																		itemHeight: 60,
																		inset: 0,
																		spacing: 0,
																		lineSpacing: 10)
			mainCollectionView.collectionViewLayout = layout
			mainCollectionView.delegate = self
			mainCollectionView.reloadData()
		}
	}
	
	// MARK: - ViewController LifeCycle
	override func viewDidLoad() {
		super.viewDidLoad()

	}
	
	


}

extension MainViewController: UICollectionViewDelegateFlowLayout {
	func collectionView(_ collectionView: UICollectionView,
											layout collectionViewLayout: UICollectionViewLayout,
											referenceSizeForHeaderInSection section: Int) -> CGSize {
		return CGSize(width: collectionView.bounds.width, height: 70)
	}
}

extension MainViewController: UICollectionViewDelegate {}
