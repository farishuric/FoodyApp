//
//  ViewController.swift
//  FoodyApp
//
//  Created by Macbook on 27. 1. 2022..
//

import UIKit


class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
     
    @IBOutlet weak var tableView: UITableView!
    
    var receipt: Receipt?
    var receipts: [Recipe] = []
    let searchController = UISearchController(searchResultsController: nil)
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView.delegate = self
        tableView.dataSource = self
        
        let cell = UINib(nibName: "TableViewCell", bundle: nil)
        tableView.register(cell, forCellReuseIdentifier: "TableViewCell")
        loadData(searchTerm: "random")

        
        setSearchBarParameters()
    }
    
    
    
    func loadData(searchTerm: String) {
        //        guard let url = URL(string: "https://api.edamam.com/api/recipes/v2?%20app_id=09ca8e0c&app_key=6d7b3bc0747904aea1211a0c4e3ca425&type=public&q=chocolate") else {
        //            print("Invalid URL")
        //            return
        //        }
        
        receipts = []
        var components = URLComponents()
        
        components.scheme = "https"
        components.host = "api.edamam.com"
        components.path = "/api/recipes/v2"
        components.queryItems = [
            URLQueryItem(name: "app_id", value: "09ca8e0c"),
            URLQueryItem(name: "app_key", value: "6d7b3bc0747904aea1211a0c4e3ca425"),
            URLQueryItem(name: "type", value: "public"),
            URLQueryItem(name: "q", value: searchTerm.trimmingCharacters(in: .whitespacesAndNewlines))
        ]
        
        guard let url = components.url else {
            return
        }
        
        
        let request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) {data, response, error in
            if let data = data {
                if let decodedResponse = try? JSONDecoder().decode(Receipt.self, from: data) {
                    DispatchQueue.main.async {
                        self.receipt = decodedResponse.self
                        for item in self.receipt!.hits {
                            self.receipts.append(item.recipe)
                        }
                        self.tableView?.reloadData()
                    }
                    return
                }
            }
            print("Fetch failed: \(error?.localizedDescription ?? "Unknown error")")
            
        }.resume()
    }
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "DetailsViewController") as? DetailsViewController {
            vc.recept = self.receipts[indexPath.row]
            self.navigationController?.pushViewController(vc, animated: true)
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.receipts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell") as? TableViewCell {
            cell.recept = self.receipts[indexPath.row]
            return cell
        }
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        200
    }
    

    
}


extension ViewController: UISearchResultsUpdating, UISearchBarDelegate {
   
    func updateSearchResults(for searchController: UISearchController) {
        return
    }
    
    
    var isSearchBarEmpty: Bool {
        return searchController.searchBar.text?.isEmpty ?? true
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchText = searchController.searchBar.text else {
            return
        }
        loadData(searchTerm: searchText)
        print(searchText)
        tableView?.reloadData()
      
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        print("cancel clicked")
        searchController.searchBar.text = nil
        searchBar.text = nil
        searchBar.resignFirstResponder()
//        !isSearchBarEmpty ? "empty" : "has letters"
        loadData(searchTerm: "random")
        tableView?.reloadData()
    }
    
    func setSearchBarParameters(){
        
        searchController.searchResultsUpdater = self
        searchController.searchBar.delegate = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search Receipes"
        navigationItem.searchController = searchController
        definesPresentationContext = true
        
        
    }
    

}



