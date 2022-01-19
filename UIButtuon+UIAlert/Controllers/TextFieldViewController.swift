//
//  TextFieldViewController.swift
//  UIButtuon+UIAlert
//
//  Created by Арген on 19.01.2022.
//

import UIKit

class TextFieldViewController: UIViewController, UITextViewDelegate, UITextFieldDelegate {
    
    let textField: UITextField = {
       let textField = UITextField()
        textField.placeholder = "Введите текст"
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    let button: UIButton = {
       let button = UIButton()
        button.setTitle("Share", for: .normal)
        button.backgroundColor = .darkGray
        button.layer.cornerRadius = 8
        button.addTarget(self, action: #selector(shareAction), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        textField.frame = CGRect(x: 0, y: 0, width: 300, height: 44)
        textField.center = view.center
        textField.delegate = self
        view.addSubview(textField)
        
        button.frame = CGRect(x: 120, y: 450, width: 150, height: 44)
        view.addSubview(button)
        
    }
    
    //Свернуть клавиатуру когда нажимаешь на клавишу "return"
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    //Создали активиту контроллер, который снизу появляется экран чтобы разшарить данные...
    @objc private func shareAction() {
        let activityController = UIActivityViewController(activityItems: [textField.text ?? ""], applicationActivities: nil)
        present(activityController, animated: true, completion: nil)
    }

}
