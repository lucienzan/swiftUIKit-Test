//
//  TodoCellTableViewCell.swift
//  Todo
//
//  Created by Daniel on 1/13/24.
//

import UIKit

class TodoCellTableViewCell: UITableViewCell {

    var noteCell: NoteModel? {
        didSet{
            titleLabel.text = noteCell?.title
            if let status = statusView.subviews.last as? UILabel {
                if let isComplete = noteCell?.isComplete, isComplete {
                    status.text = "Complete"
                    statusView.backgroundColor = UIColor(red: 159.0/255.0, green: 230.0/255.0, blue: 160.0/255.0, alpha: 1)
                }else{
                    status.text = "In Progress"
                    statusView.backgroundColor = UIColor(red: 182.0/255.0, green: 187.0/255.0, blue: 196.0/255.0, alpha: 1)
                }
            }
        }
    }
    
    // MARK: Properties
    private let titleLabel: UILabel = {
        let label = UILabel();
        label.font = .boldSystemFont(ofSize: 15)
        label.textColor = .black
        label.text = "Title Lable"
        return label
    }()
    
    private let statusView: UIView = {
        // Use a separate label for the status text
           let view = UIView()
           let label = UILabel()
        
           label.font = .systemFont(ofSize: 8)
           label.textColor = .black
           label.text = "Complete"
           label.translatesAutoresizingMaskIntoConstraints = false  // Make sure to set this to false for manual constraints
           
           // Adjust the corner radius of the label, not the view
           view.layer.cornerRadius = 10
           label.layer.masksToBounds = true  // Ensure that the label's corners are rounded
           
           // Add the label to the view
           view.addSubview(label)
        
        // Set constraints for the label
        label.anchor(top: view.topAnchor,left: view.leftAnchor,bottom: view.bottomAnchor,right: view.rightAnchor,paddingTop: 5,paddingLeft: 18, paddingBottom: 5, paddingRight: 18)
           
           // Set background color for the view
           view.backgroundColor = UIColor(red: 159.0/255.0, green: 230.0/255.0, blue: 160.0/255.0, alpha: 1)
           
           return view
    }()
    
    
    // MARK: Life Cycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(titleLabel)
        titleLabel.anchor(top: topAnchor, left: leftAnchor, paddingTop: 10, paddingLeft: 10)
        addSubview(statusView)
        // setting status label top anchor after the title label bottom
        statusView.anchor(top:titleLabel.bottomAnchor,left: titleLabel.leftAnchor,paddingTop: 8,paddingLeft: 4)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Selectors
    
    // MARK: Hepler Fun
    

}
