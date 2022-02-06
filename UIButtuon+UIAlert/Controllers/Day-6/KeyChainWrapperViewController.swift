//
//  KeyChainWrapperViewController.swift
//  UIButtuon+UIAlert
//
//  Created by Арген on 06.02.2022.
//

import UIKit
import SwiftKeychainWrapper

class KeyChainWrapperViewController: UIViewController {
    
    let standard = KeychainWrapper.standard
    
    private let label: UILabel = {
       let label = UILabel()
        label.font = .systemFont(ofSize: 32)
        label.textColor = .black
        label.text = "Hello World!"
        label.frame = CGRect(x: 82, y: 250, width: 250, height: 34)
        label.textAlignment = .center
        return label
    }()
    
    private let textField: UITextField = {
       let textF = UITextField()
        textF.placeholder = "Write here"
        textF.textColor = .black
        textF.layer.cornerRadius = 8
        textF.borderStyle = .roundedRect
        textF.layer.borderWidth = 0.8
        textF.layer.borderColor = UIColor.systemCyan.cgColor
        textF.frame = CGRect(x: 107, y: 290, width: 200, height: 34)
        return textF
    }()

    private let button: UIButton = {
        let button = UIButton()
        button.setTitle("Tap Here", for: .normal)
        button.tintColor = .black
        button.backgroundColor = .gray
        button.frame = CGRect(x: 0, y: 0, width: 100, height: 44)
        button.layer.cornerRadius = button.frame.height * 0.5
        button.addTarget(self, action: #selector(saveValue), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        button.center = view.center
        view.addSubview(button)
        view.addSubview(label)
        view.addSubview(textField)
        
        let labelValue = standard.string(forKey: "save")
        label.text = labelValue
        
    }
    
    @objc private func saveValue() {
        label.text = textField.text
        standard.set(label.text ?? "", forKey: "save")
    }

}
