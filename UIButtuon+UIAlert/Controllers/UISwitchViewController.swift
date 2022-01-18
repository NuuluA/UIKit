//
//  SecondViewController.swift
//  UIButtuon+UIAlert
//
//  Created by Арген on 18.01.2022.
//

import UIKit

class UISwitchViewController: UIViewController {

    var switchIsOn = UISwitch()
    var button = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        switchIsOn.frame = CGRect(x: 180, y: 400, width: 0, height: 0)
        switchIsOn.setOn(true, animated: true)
        switchIsOn.thumbTintColor = .black
        switchIsOn.tintColorDidChange()
        switchIsOn.addTarget(self, action: #selector(isOn), for: .touchUpInside)
        view.addSubview(switchIsOn)
        
        button.setTitle("Press me", for: .normal)
        button.setTitle("Pressed", for: .highlighted)
        button.backgroundColor = .darkGray
        button.layer.cornerRadius = 10
        button.frame = CGRect(x: 140, y: 300, width: 150, height: 50)
        view.addSubview(button)
        
    }

    @objc private func isOn() {
        if switchIsOn.isOn {
            view.backgroundColor = .red
            button.isUserInteractionEnabled = true
            print("On")
        } else {
            view.backgroundColor = .systemBackground
            button.isUserInteractionEnabled = false
            print("Off")
        }
    }

}
