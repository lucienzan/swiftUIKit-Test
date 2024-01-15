//
//  ViewController.swift
//  Todo
//
//  Created by Daniel on 1/13/24.
//

import UIKit

class ViewController: UITableViewController {

    // MARK: Properties
    
    let identifier = "listCell"
    var allNotes = [NoteModel](){
        didSet {
            tableView.reloadData()
        }
    }
    
    private let plusBtn: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(systemName: "plus"), for: .normal)
        btn.backgroundColor = UIColor(red: 159.0/255.0, green: 230.0/255.0, blue: 160.0/255.0, alpha: 1)
        btn.tintColor = .black
        btn.layer.zPosition = CGFloat(Float.greatestFiniteMagnitude)
        btn.addTarget(self, action: #selector(createNew), for: .touchUpInside)
        return btn
    }()
    
    // MARK: Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configuration();
        fetchGetItems()
    }
    
    // MARK : API
    func fetchGetItems() {
        PostService.share.fetchAllItems{ (items) in
            print(items)
            self.allNotes = items
        }
    }

    // MARK: Helper
    func configuration() {
        tableView.register(TodoCellTableViewCell.self, forCellReuseIdentifier: identifier)
        tableView.rowHeight = 75
        
        // remove other unnecessary blank rows
        tableView.tableFooterView = UIView()
        let refreshControl = UIRefreshControl()
        refreshControl.tintColor = UIColor(red: 182.0/255.0, green: 187.0/255.0, blue: 196.0/255.0, alpha: 1)
        refreshControl.addTarget(self, action: #selector(refreshData), for: .valueChanged)
        tableView.refreshControl = refreshControl
        
        // button
        tableView.addSubview(plusBtn)
        plusBtn.anchor(bottom: tableView.safeAreaLayoutGuide.bottomAnchor, right: tableView.safeAreaLayoutGuide.rightAnchor, paddingBottom: 20 , paddingRight: 20, width: 56, height: 56)
        plusBtn.layer.cornerRadius = 56/2
        plusBtn.alpha = 1
    }
    
    // MARK: Selectors
    @objc func createNew() {
       let createView = CreateViewController()
        present(createView, animated: true, completion: nil)
    }
    
    @objc func refreshData() {
        self.tableView.refreshControl?.beginRefreshing()
        if let isRefreshing = self.tableView.refreshControl?.isRefreshing,
           isRefreshing {
            DispatchQueue.main.async { [self] in
                self.fetchGetItems()
                tableView.refreshControl?.endRefreshing()
            }
        }
    }
}

// MARK: DataSource and Delegate
extension ViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.allNotes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as? TodoCellTableViewCell else { return UITableViewCell()}
        cell.noteCell = allNotes[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let id = allNotes[indexPath.row].id
        PostService.share.updateItem(status: true, id: id){
            (error,ref) in
            self.fetchGetItems();
        }
        
    }
}

