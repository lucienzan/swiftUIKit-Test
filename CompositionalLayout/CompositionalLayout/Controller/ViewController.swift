//
//  ViewController.swift
//  CompositionalLayout
//
//  Created by Daniel on 1/19/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageCollectionView: UICollectionView!
    var restaurantImages = ["Cafe Deadend", "Homei", "Teakha", "Cafe Loisl", "Petite Oyster", "For Kee Restaurant", "Po's Atelier", "Bourke Street Bakery","Haigh's Chocolate", "Palomino Espresso", "Upstate", "Traif", "Graham Avenue Meats And Deli", "Waffle & Wolf", "Five Leaves", "Cafe Lore", "Confessional","Barrafina", "Donostia", "Royal Oak", "CASK Pub and Kitchen"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }

    func configure() {
        imageCollectionView.delegate = self
        imageCollectionView.dataSource = self
        imageCollectionView.collectionViewLayout = createLayout()
    }
    
    func createLayout() -> UICollectionViewCompositionalLayout {
        let item = CompositionalLayout.item(width: .fractionalHeight(0.5), height: .fractionalHeight(1), spacing: (top: 0, leading: 0, bottom: 0, trailing: 0))
        let group = CompositionalLayout.group(alignment: .horizontal, width: .fractionalWidth(1), height: .fractionalHeight(0.4), item: item, count: 2)
        let section = CompositionalLayout.section(group: group)
        return UICollectionViewCompositionalLayout(section: section)
    }

}

