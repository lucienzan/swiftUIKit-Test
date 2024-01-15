//
//  MainTableViewCell.swift
//  AlamoTest
//
//  Created by Daniel on 1/15/24.
//

import UIKit

class MainTableViewCell: UITableViewCell {

    @IBOutlet weak var imageName: UILabel!
    @IBOutlet weak var imgTaker: UILabel!
    @IBOutlet weak var pic: UIImageView!
    static let identifier = "datacell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        pic.translatesAutoresizingMaskIntoConstraints = false
        pic.widthAnchor.constraint(equalToConstant: 120).isActive = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
