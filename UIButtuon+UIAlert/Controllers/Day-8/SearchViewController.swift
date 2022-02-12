//
//  SearchBarViewController.swift
//  UIButtuon+UIAlert
//
//  Created by Арген on 12.02.2022.
//

import UIKit

class SearchViewController: UIViewController, UISearchControllerDelegate {
    @IBOutlet weak var search: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    let fruits = ["Apple", "Banana", "Mango", "Melon", "Limon", "Kiwi", "Awocado", "Pear", "Plum"]
    var sortFruits: [String]?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        
        tableView.dataSource = self
        search.delegate = self
        
        sortFruits = fruits
    }

}

extension SearchViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let sorted = sortFruits {
            return sorted.count
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = sortFruits?[indexPath.row]
        return cell
    }
}

extension SearchViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        sortFruits = []
        
        //если searchText пустой тогда вернем массив fruits
        if searchText == "" {
            sortFruits = fruits
        }
        
        for sorted in fruits {
            if sorted.uppercased().contains(searchText.uppercased()) {
                sortFruits?.append(sorted)
            }
        }
        self.tableView.reloadData()
    }
}
