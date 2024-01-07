//
//  ViewController.swift
//  tableView
//
//  Created by Daniel on 1/7/24.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var restaurantNames = ["Cafe Deadend", "Homei", "Teakha", "Cafe Loisl", "Petite Oyster", "For Kee Restaurant", "Po's Atelier", "Bourke Street Bakery"
        ,"Haigh's Chocolate", "Palomino Espresso", "Upstate", "Traif", "Graham Avenue Meats And Deli", "Waffle & Wolf", "Five Leaves", "Cafe Lore", "Confessional", "Barrafina", "Donostia", "Royal Oak", "CASK Pub and Kitchen"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return restaurantNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identify = "datacell";
        let cell = tableView.dequeueReusableCell(withIdentifier: identify, for: indexPath);
        cell.textLabel?.text = restaurantNames[indexPath.row];
        cell.imageView?.image = UIImage(named: "restaurant");
        return cell;
    }
    
    // if you don't want to show status bar
    override var prefersStatusBarHidden: Bool {
    return true
    }

}

