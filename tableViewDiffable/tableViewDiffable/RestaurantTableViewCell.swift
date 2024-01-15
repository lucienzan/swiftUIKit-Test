//
//  RestaurantTableViewCell.swift
//  tableViewDiffable
//
//  Created by Daniel on 1/13/24.
//

import UIKit

class RestaurantTableViewCell: UITableViewCell {

    @IBOutlet weak var foodImage: UIImageView!
    @IBOutlet weak var foodTitle: UILabel!
    @IBOutlet weak var foodLocation: UILabel!
    @IBOutlet weak var foodType: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
