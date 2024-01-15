//
//  RestaurantTableViewController.swift
//  tableViewDiffable
//
//  Created by Daniel on 1/7/24.
//

import UIKit

class RestaurantTableViewController: UITableViewController {

    var restaurantNames = ["Cafe Deadend", "Homei", "Teakha", "Cafe Loisl", "Petite Oyster", "For Kee Restaurant", "Po's Atelier", "Bourke Street Bakery","Haigh's Chocolate", "Palomino Espresso", "Upstate", "Traif", "Graham Avenue Meats", "Waffle & Wolf", "Five Leaves", "Cafe Lore", "Confessional","Barrafina", "Donostia", "Royal Oak", "CASK Pub and Kitchen"]
    
    var restaurantImages = ["Cafe Deadend", "Homei", "Teakha", "Cafe Loisl", "Petite Oyster", "For Kee Restaurant", "Po's Atelier", "Bourke Street Bakery","Haigh's Chocolate", "Palomino Espresso", "Upstate", "Traif", "Graham Avenue Meats And Deli", "Waffle & Wolf", "Five Leaves", "Cafe Lore", "Confessional","Barrafina", "Donostia", "Royal Oak", "CASK Pub and Kitchen"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = dataSource;
        var snapShot = NSDiffableDataSourceSnapshot<Section,String>();
        snapShot.appendSections([.all])
        snapShot.appendItems(restaurantNames, toSection: .all)
        
        dataSource.apply(snapShot,animatingDifferences: false)
    }
    
    enum Section {
        case all
    }
    
    lazy var dataSource = ConfigureDataSource()
    
    func ConfigureDataSource() -> UITableViewDiffableDataSource<Section,String>{
        let identitfyCell = "datacell"
        let dataSource = UITableViewDiffableDataSource<Section,String>(
            tableView:tableView,
                cellProvider: { tableview, indexpath, restaurantName in
                    let cell = tableview.dequeueReusableCell(withIdentifier: identitfyCell, for: indexpath) as! RestaurantTableViewCell
                    cell.foodTitle?.text = restaurantName
                    cell.foodImage?.image = UIImage(named: self.restaurantImages[indexpath.row])
                    return cell;
                }
            )
        return dataSource
    }
}


