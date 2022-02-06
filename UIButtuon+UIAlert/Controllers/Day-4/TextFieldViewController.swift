//
//  TextFieldViewController.swift
//  UIButtuon+UIAlert
//
//  Created by Арген on 19.01.2022.
//

import UIKit

 final class TextFieldViewController: UIViewController, UITextFieldDelegate {
    
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
    
    let label: UILabel = {
       let label = UILabel()
        label.text = "Hello"
        label.textColor = .black
        return label
    }()

    let labelButton: UIButton = {
       let labelButton = UIButton()
        labelButton.setTitle("Change", for: .normal)
        labelButton.backgroundColor = .gray
        labelButton.layer.cornerRadius = 9
        labelButton.addTarget(self, action: #selector(changeLabel), for: .touchUpInside)
        return labelButton
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(labelButton)
        labelButton.frame = CGRect(x: 150, y: 300, width: 100, height: 44)
        
        view.addSubview(label)
        label.frame = CGRect(x: 160, y: 200, width: 150, height: 30)

        textField.frame = CGRect(x: 0, y: 0, width: 300, height: 44)
        textField.center = view.center
        textField.delegate = self
        view.addSubview(textField)
        
        button.frame = CGRect(x: 120, y: 450, width: 150, height: 44)
        view.addSubview(button)
        
    }
    
    //Свернуть клавиатуру когда нажимаешь на клавишу "return"
//    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//        textField.resignFirstResponder()
//        return true
//    }
    
    //Создали активиту контроллер, который снизу появляется экран чтобы разшарить данные...
    @objc private func shareAction() {
        let activityController = UIActivityViewController(activityItems: [textField.text ?? ""], applicationActivities: nil)
        present(activityController, animated: true, completion: nil)
    }
    
    @objc private func changeLabel() {
        let changeLabel = textField.text
        label.text = changeLabel
    }
    
    //Свернуть клавиатуру когда нажимаешь на любую точку экрана
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if touches.first != nil {
            view.endEditing(true)
        }
    }

}
