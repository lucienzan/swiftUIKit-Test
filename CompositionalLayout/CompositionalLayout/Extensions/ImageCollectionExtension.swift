//
//  ImageCollectionExtension.swift
//  CompositionalLayout
//
//  Created by Daniel on 1/19/24.
//

import UIKit

extension ViewController : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.restaurantImages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "imgCollection", for: indexPath) as! ImageViewCell
        cell.setup(image: UIImage(named: restaurantImages[indexPath.row])!)
        return cell
    }
}

extension ViewController : UICollectionViewDelegate {
    
}
