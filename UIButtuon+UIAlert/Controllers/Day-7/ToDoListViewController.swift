//
//  ToDoListViewController.swift
//  UIButtuon+UIAlert
//
//  Created by Арген on 07.02.2022.
//

import UIKit

class ToDoListViewController: UIViewController {

    private var toDolistDataSource: ToDoListDataSource?
    
    static var items = [String]()
    
    let tableView: UITableView = {
        let table = UITableView()
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return table
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(tableView)
        toDolistDataSource = ToDoListDataSource()
        tableView.dataSource = toDolistDataSource
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add,
                                                            target: self,
                                                            action: #selector(addItem))
        ToDoListViewController.items = UserDefaults.standard.stringArray(forKey: "save") ?? []
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
                
    }

    @objc private func addItem() {
        
        //Создаем AlertController
        let alert = UIAlertController(title: "New Items", message: "Creat new items", preferredStyle: .alert)
        //В alertController создаем TextField
        alert.addTextField { field in
            field.placeholder = "Add"
        }
        //Создали alert кнопку "Cencel"
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        //Создали alert кнопку "Done"
        alert.addAction(UIAlertAction(title: "Done", style: .default, handler: { [weak self] _ in
            if let field = alert.textFields?.first {
                if let text = field.text, !text.isEmpty {
                    
                    //отправляем на главный поток
                    DispatchQueue.main.async {
                        ToDoListViewController.items.append(text)
                        var newItems = UserDefaults.standard.stringArray(forKey: "save") ?? []
                        newItems.append(text)
                        UserDefaults.standard.setValue(newItems, forKey: "save")
                        self?.tableView.reloadData()
                    }
                    
                }
            }
        }))
        present(alert, animated: true, completion: nil)
    }
}

    
    


