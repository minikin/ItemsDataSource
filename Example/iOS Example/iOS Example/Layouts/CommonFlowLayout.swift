//
//  CommonFlowLayout.swift
//  iOS Example
//
//  Created by Sasha Prokhorenko on 19.12.17.
//  Copyright © 2017 Sasha Prokhorenko. All rights reserved.
//

import UIKit

final class CommonFlowLayout: UICollectionViewFlowLayout {
	
	// MRK: - Properties
	let columns: CGFloat
	let itemHeight: CGFloat
	let inset: CGFloat
	let spacing: CGFloat
	let lineSpacing: CGFloat
	
	// MARK: - Init
	init(columns: CGFloat, itemHeight: CGFloat, inset: CGFloat, spacing: CGFloat, lineSpacing: CGFloat) {
		self.columns = columns
		self.itemHeight = itemHeight
		self.inset = inset
		self.spacing = spacing
		self.lineSpacing = lineSpacing
		super.init()
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	// MARK: - Layout Lifecycle
	override func prepare() {
		super.prepare()
		setupLayout()
	}
	
	func itemWidth() -> CGFloat {
		return ((collectionView!.frame.width / columns) - (inset + spacing))
	}
	
	override var itemSize: CGSize {
		set {
			self.itemSize = CGSize(width: itemWidth(), height: itemHeight)
		}
		get {
			return CGSize(width: itemWidth(), height: itemHeight)
		}
	}
	
	func setupLayout() {
		minimumInteritemSpacing = spacing
		minimumLineSpacing = lineSpacing
	}
	
	override func targetContentOffset(forProposedContentOffset proposedContentOffset: CGPoint) -> CGPoint {
		return collectionView!.contentOffset
	}
	
	override open func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
		return true
	}
}
