//
//  ImageViewCell.swift
//  CompositionalLayout
//
//  Created by Daniel on 1/19/24.
//

import UIKit

class ImageViewCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
    
    func setup(image: UIImage) {
        imageView?.image = image
    }
}
