//
//  ViewController.swift
//  UIButtuon+UIAlert
//
//  Created by Арген on 18.01.2022.
//

import UIKit

class UIButtonUIAlertViewController: UIViewController {
    
    var button = UIButton()
    var button2 = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        buttons()
        view.addSubview(button)
        view.addSubview(button2)
    }
    
    private func buttons() {
        button = UIButton(type: .roundedRect)
        button.frame = CGRect(x: 150, y: 300, width: 100, height: 44)
        button.tintColor = .black
        button.setTitle("Press", for: .normal)
        button.addTarget(self, action: #selector(uiAlert), for: .touchUpInside)
        
        button2 = UIButton(type: .roundedRect)
        button2.frame = CGRect(x: 150, y: 500, width: 100, height: 44)
        button2.tintColor = .black
        button2.setTitle("Press", for: .normal)
        button2.addTarget(self, action: #selector(actionSheet), for: .touchUpInside)
    }
    
    @objc private func uiAlert() {
        let alert = UIAlertController(title: "Attension", message: "Press here", preferredStyle: .alert)
        let action = UIAlertAction(title: "Next", style: .default) { _ in
            DispatchQueue.main.async {
                let vc = UISwitchViewController()
                self.navigationController?.pushViewController(vc, animated: true)
            }
        }
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alert.addAction(action)
        alert.addAction(cancel)
        present(alert, animated: true, completion: nil)
    }
    
    @objc private func actionSheet() {
        let alert = UIAlertController(title: "Attension", message: "Press here", preferredStyle: .actionSheet)
        let action = UIAlertAction(title: "Next", style: .default) { _ in
            DispatchQueue.main.async {
                let vc = UISwitchViewController()
                self.navigationController?.pushViewController(vc, animated: true)
            }
        }
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alert.addAction(action)
        alert.addAction(cancel)
        present(alert, animated: true, completion: nil)
    }
    

}

