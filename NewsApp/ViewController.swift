//
//  ViewController.swift
//  NewsApp
//
//  Created by suhemparashar on 15/06/23.
//

import UIKit

class ViewController: UIViewController {
  
    @IBOutlet weak var tableView: UITableView!
    
    var viewModel = ViewModel()
    let loaderView = LoaderView()
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.register(UINib(nibName:"NewsCell", bundle: nil), forCellReuseIdentifier: "Reusable Cell")
        viewModel.delegate = self
        loaderView.show()
        viewModel.getNews()
    }
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.getNewsCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let imageURL = viewModel.getNewsImageURL(index: indexPath.row)
        let newsTitle = viewModel.getNewsTitle(index: indexPath.row)
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Reusable Cell", for: indexPath) as! NewsCell
        
        cell.newsTitle.text = newsTitle
        
        viewModel.setUpImageView(imageURLString: imageURL) { image in
            if let image = image {
                DispatchQueue.main.async {
                    cell.newsImage.image = image
                }
            } else {
                print("image request failed")
            }
        }
        return cell
    }
}

extension ViewController: Delegate {
    func apiCallDidComplete() {
        DispatchQueue.main.async {
            self.loaderView.hide()
            self.tableView.reloadData()
        }
    }
    
    
}
