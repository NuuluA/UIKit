//
//  ScrollViewViewController.swift
//  UIButtuon+UIAlert
//
//  Created by Арген on 01.02.2022.
//

import UIKit

final class ScrollViewViewController: UIViewController {
    
    var scrollView = UIScrollView()
    var imageArray = [UIImage]()

    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.frame = view.frame
        creatScrollView()
    }
    
    private func creatScrollView() {
        let scrollViewRect = self.view.bounds
        scrollView = UIScrollView(frame: scrollViewRect)
        scrollView.isPagingEnabled = true
        scrollView.contentSize = CGSize(width: scrollViewRect.size.width*3, height: scrollViewRect.size.height)
        createImages()
        view.addSubview(scrollView)
    }
    
    private func createImages() {
        imageArray = [
            UIImage(named: "image")!,
            UIImage(named: "image2")!,
            UIImage(named: "image3")!
        ]
        
        for image in 0..<imageArray.count {
            
            let imageView = UIImageView()
            imageView.image = imageArray[image]
            imageView.contentMode = .scaleAspectFit
            
            let xPos = self.view.frame.width * CGFloat(image)
            imageView.frame = CGRect(x: xPos, y: 0, width: scrollView.frame.width, height: scrollView.frame.height)
            
//            scrollView.contentSize.width = scrollView.frame.width * CGFloat(image) + 1
            
            scrollView.addSubview(imageView)
        }
        
    }
 
}
