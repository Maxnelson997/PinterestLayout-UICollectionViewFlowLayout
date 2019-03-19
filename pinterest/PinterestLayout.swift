//
//  PinterestLayout.swift
//  pinterest
//
//  Created by Max Nelson on 3/3/19.
//  Copyright © 2019 Maxcodes. All rights reserved.
//

import UIKit

class PinterestLayout: UICollectionViewFlowLayout {
    
    weak var delegate: PinterestDelegate!
    
    var cache = [UICollectionViewLayoutAttributes]()
    
    fileprivate let numberOfColumns = 2
    
    fileprivate var contentHeight: CGFloat = 0
    fileprivate var contentWidth: CGFloat {
        guard let collectionView = collectionView else { return 0.0 }
        let insets = collectionView.contentInset
        return collectionView.bounds.width - (insets.left + insets.right)
    }
    override var collectionViewContentSize: CGSize {
        return CGSize(width: contentWidth, height: contentHeight)
    }
    
    override func prepare() {
        guard let collection = collectionView else { return }
        let columnWidth = contentWidth / CGFloat(numberOfColumns)
        
        var xOffset = [CGFloat]()
        var yOffset = [CGFloat](repeating: 0, count: numberOfColumns)
        
        for column in 0 ..< numberOfColumns {
            xOffset.append(CGFloat(column) * columnWidth)
        }
        
        var columnToPlacePhoto = 0
        
        for item in 0 ..< collection.numberOfItems(inSection: 0) {
            let indexPath = IndexPath(item: item, section: 0)
            let photoHeight:CGFloat = delegate.collectionView(collection, numberOfColumns: numberOfColumns, heightForPhotoAtIndexPath: indexPath)
            let frame = CGRect(x: xOffset[columnToPlacePhoto], y: yOffset[columnToPlacePhoto], width: columnWidth, height: photoHeight)
            let attributes = UICollectionViewLayoutAttributes(forCellWith: indexPath)
            attributes.frame = frame
            self.cache.append(attributes)
            
            yOffset[columnToPlacePhoto] = yOffset[columnToPlacePhoto] + photoHeight
            columnToPlacePhoto = columnToPlacePhoto < (numberOfColumns - 1) ? (columnToPlacePhoto + 1) : 0
        }
        
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        return cache
    }
}
