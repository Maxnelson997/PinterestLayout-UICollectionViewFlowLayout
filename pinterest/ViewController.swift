//
//  ViewController.swift
//  pinterest
//
//  Created by Max Nelson on 3/2/19.
//  Copyright © 2019 Maxcodes. All rights reserved.
//

import UIKit

protocol PinterestDelegate: class {
    func collectionView(_ collectionView: UICollectionView, numberOfColumns: Int, heightForPhotoAtIndexPath indexPath: IndexPath) -> CGFloat
}


class ViewController: UIViewController {
    
    fileprivate var images: [String] = [
        "alex0",
        "alex1",
        "max",
        "max",
        "alex0",
        "alex1"
    ]

    override func viewDidLoad() {
        super.viewDidLoad()

        let layout = PinterestLayout()
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        
        let collection = UICollectionView(frame: UIScreen.main.bounds, collectionViewLayout: layout)
        collection.backgroundColor = .white
        collection.register(PinterestCell.self, forCellWithReuseIdentifier: "CELL")
        collection.dataSource = self
        
        if let layout = collection.collectionViewLayout as? PinterestLayout {
            layout.delegate = self
        }
        
        view.addSubview(collection)
    }


}

extension ViewController: PinterestDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfColumns: Int, heightForPhotoAtIndexPath indexPath: IndexPath) -> CGFloat {
        let image = UIImage(named: self.images[indexPath.item])!
        let imageHeight = image.size.height
        let imageWidth = image.size.width
        let columnRatio:CGFloat = 1/CGFloat(numberOfColumns)
        let imageSizeRatio = (collectionView.frame.width * columnRatio) / imageWidth
        return imageHeight * imageSizeRatio
    }
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CELL", for: indexPath) as! PinterestCell
        let image = UIImage(named: self.images[indexPath.row])
        cell.image = image
        return cell
    }
}

