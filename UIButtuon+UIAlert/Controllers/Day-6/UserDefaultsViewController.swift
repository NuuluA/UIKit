//
//  UserDefaultsViewController.swift
//  UIButtuon+UIAlert
//
//  Created by Арген on 06.02.2022.
//

import UIKit

final class UserDefaultsViewController: UIViewController {
    
    let standard = UserDefaults.standard
    
    private let label: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 144, y: 144, width: 150, height: 24)
        label.textColor = .black
        label.font = .systemFont(ofSize: 32)
        label.text = "Hello World!"
        return label
    }()
    
    private let switchView: UISwitch = {
       let isOn = UISwitch()
        isOn.isOn = true
        isOn.addTarget(self, action: #selector(changeValue), for: .valueChanged)
        return isOn
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(label)
        switchView.center = view.center
        view.addSubview(switchView)

        updateUserDefaults()

    }

    @objc private func changeValue(_ sender: UISwitch) {
        if sender.isOn {
            view.backgroundColor = .systemBlue
            label.text = "View Blue"
            userDefaults(sender)
        } else {
            view.backgroundColor = .systemRed
            label.text = "View Red"
            userDefaults(sender)
        }
    }
    
    private func updateBackground(isOn: Bool) {
        view.backgroundColor = isOn ? .systemBlue : .systemRed
        switchView.isOn
    }
    
    private func userDefaults(_ sender: UISwitch) {
        standard.set(sender.isOn, forKey: "viewColor")
        standard.set(sender.isOn, forKey: "isOn")
        standard.set(label.text, forKey: "textChanged")
    }
    
    private func updateUserDefaults() {
        
        let switchValue = standard.bool(forKey: "isOn")
        let labelValue = standard.string(forKey: "textChanged")
        let viewColor = standard.bool(forKey: "viewColor")
        updateBackground(isOn: viewColor)
        switchView.isOn = switchValue
        label.text = labelValue
    }
}
