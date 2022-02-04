//
//  TextViewViewController.swift
//  UIButtuon+UIAlert
//
//  Created by Арген on 01.02.2022.
//

import UIKit

final class TextViewViewController: UIViewController {

    var textView = UITextView()

    override func viewDidLoad() {
        super.viewDidLoad()
        createTextView()
        
    }
    
    private func createTextView() {
        textView = UITextView(frame: CGRect(x: 50, y: 300, width: view.bounds.width/1.5, height: view.bounds.height/4))
        textView.textColor = .black
        textView.font = .systemFont(ofSize: 16)
        textView.text = "Hello"
        textView.backgroundColor = .gray
        view.addSubview(textView)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }

}
