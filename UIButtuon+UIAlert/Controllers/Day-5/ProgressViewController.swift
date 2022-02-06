//
//  ProgressViewController.swift
//  UIButtuon+UIAlert
//
//  Created by Арген on 01.02.2022.
//

import UIKit

class ProgressViewController: UIViewController {
    
    let progressView = UIProgressView()
    let myButton = UIButton()
    var timer = Timer()
    var isRunning = false

    override func viewDidLoad() {
        super.viewDidLoad()
        
        createButton(myButton)
        createProgress(progressView)
    }
    
    @objc private func updateProgess() {
        if progressView.progress != 1.0 {
            progressView.progress += 0.1 / 1.0
        } else if progressView.progress == 1.0 {
            UIView.animate(withDuration: 0.7) {
                self.myButton.alpha = 1
                self.timer.invalidate()
            }
        }
    }
    
    private func createProgress(_ progress: UIProgressView) {
        progress.progressViewStyle = .bar
        progress.setProgress(0.0, animated: true)
        progress.progressTintColor = .red
        progress.trackTintColor = .gray
        progress.frame = CGRect(x: view.center.x, y: view.center.y, width: 150, height: 50)
        progress.center = view.center
        view.addSubview(progress)
    }
    
    private func createButton(_ button: UIButton) {
        button.setTitle("Start", for: .normal)
        button.backgroundColor = .gray
        button.tintColor = .white
        button.frame = CGRect(x: 150, y: 500, width: 100, height: 44)
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(updateTimer), for: .touchUpInside)
        view.addSubview(button)
    }
    
    @objc private func updateTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1,
                                     target: self,
                                     selector: #selector(updateProgess),
                                     userInfo: nil,
                                     repeats: true)
    }
}
