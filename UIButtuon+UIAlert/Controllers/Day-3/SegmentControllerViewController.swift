//
//  SegmentControllerViewController.swift
//  UIButtuon+UIAlert
//
//  Created by Арген on 19.01.2022.
//

import UIKit

final class SegmentControllerViewController: UIViewController {
    
    var segment = UISegmentedControl()
    var imageView = UIImageView()
    let segmentArray = ["First", "Second", "Third"]
    var images = [UIImage(named: "image"),
                  UIImage(named: "image2"),
                  UIImage(named: "image3")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Создаем картинку
        imageView.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
        imageView.contentMode = .scaleAspectFill
        imageView.image = images.randomElement() as? UIImage
        imageView.center = view.center
        view.addSubview(imageView)

        //Создаем сегмент 
        segment = UISegmentedControl(items: segmentArray)
        segment.frame = CGRect(x: 70, y: 600, width: 250, height: 30)
        segment.selectedSegmentIndex = 0
        segment.addTarget(self, action: #selector(changeImage), for: .valueChanged)
        
        view.addSubview(segment)
    }

    @objc private func changeImage() {
        let change = segment.selectedSegmentIndex
        imageView.image = images[change]
    }

}
