//
//  ViewController.swift
//  AlamoTest
//
//  Created by Daniel on 1/15/24.
//

import UIKit
import Alamofire
import AlamofireImage

class ViewController: UIViewController {
   
    // MARK: - Properties
    @IBOutlet weak var tableView: UITableView!
    var results:[Result] = []
    let imageCache = AutoPurgingImageCache( memoryCapacity: 111_111_111, preferredMemoryUsageAfterPurge: 90_000_000)
    let refreshControl = UIRefreshControl()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchDataFromAPI()
        tableView.dataSource = self
        tableView.delegate = self
        
        refreshControl.tintColor = UIColor(red: 182.0/255.0, green: 187.0/255.0, blue: 196.0/255.0, alpha: 1)
        refreshControl.addTarget(self, action: #selector(refreshData), for: .valueChanged)
        tableView.refreshControl = refreshControl
    }
    
    // MARK: - Selectors
    @objc func refreshData() {
        tableView.refreshControl?.beginRefreshing()
        if let isRefreshing = tableView.refreshControl?.isRefreshing,
           isRefreshing {
            DispatchQueue.main.async { [self] in
                results = []
                self.fetchDataFromAPI()
                tableView.refreshControl?.endRefreshing()
            }
        }
    }

    // MARK: - API
    func fetchDataFromAPI() {
        if let path = Bundle.main.path(forResource: "AppConfig", ofType: "plist"),
           let keys = NSDictionary(contentsOfFile: path) as? [String: String],
           let apiKey = keys["APIKey"] {
            AF.request("https://api.unsplash.com/search/photos?page=1&query=Office&client_id=\(apiKey)").responseDecodable(of: APIPhotoResponse.self) { response in
                switch response.result {
                case .success(let apiResponse):
                    self.results.append(contentsOf: apiResponse.results)
                    for i in apiResponse.results {
                        AF.request(i.urls.regular).responseImage { (response) in
                            let image = UIImage(data: response.data!, scale: 1.0)
                            self.imageCache.add(image!, withIdentifier: i.urls.regular )
                        }
                    }
                    DispatchQueue.main.async {
                       self.tableView.reloadData()
                   }
                    // Process your decoded data here
                case .failure(let error):
                    print(error)
                    // Handle the error
                }
            }
        }
     
    }
}

// MARK: - Extension
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.results.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MainTableViewCell.identifier, for: indexPath) as! MainTableViewCell
          let data = results[indexPath.row]
          cell.imgTaker.text = data.user.name
          cell.imageName.text = data.description ?? "Unknown"
          cell.imageView?.image = self.imageCache.image(withIdentifier: data.urls.regular)
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
