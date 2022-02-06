//
//  TimerViewController.swift
//  UIButtuon+UIAlert
//
//  Created by Арген on 02.02.2022.
//

import UIKit

final class TimerViewController: UIViewController {
    
    var timer = Timer()
    
    private let timeLabel: UILabel = {
       var label = UILabel()
        label.frame = CGRect(x: 174, y: 160, width: 70, height: 30)
        label.backgroundColor = .gray
        label.textAlignment = .center
        label.tintColor = .black
        label.font = UIFont.systemFont(ofSize: 35)
        return label
    }()
    
    private let playButton: UIButton = {
       let button = UIButton()
        button.setTitle("Play", for: .normal)
        button.backgroundColor = .blue
        button.frame = CGRect(x: 0, y: 300, width: 207, height: 400)
        button.addTarget(self, action: #selector(playAction), for: .touchUpInside)
        return button
    }()
    
    private let pauseButton: UIButton = {
       let button = UIButton()
        button.setTitle("Pause", for: .normal)
        button.backgroundColor = .red
        button.frame = CGRect(x: 207, y: 300, width: 207, height: 400)
        button.addTarget(self, action: #selector(pauseAction), for: .touchUpInside)
        return button
    }()
    
    private let resetButton: UIButton = {
       let button = UIButton()
        button.setTitle("Reset", for: .normal)
        button.backgroundColor = .gray
        button.tintColor = .yellow
        button.frame = CGRect(x: 282, y: 74, width: 70, height: 30)
        button.addTarget(self, action: #selector(resetAction), for: .touchUpInside)
        return button
    }()
    
    let uiView: UIView = {
       let view = UIView()
        view.backgroundColor = .gray
        view.frame = CGRect(x: 0, y: 0, width: 414, height: 300)
        return view
    }()
    
    var isRunning = false
    var counter = 0.0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        addSubView()

    }
    
    private func addSubView() {
        uiView.addSubview(resetButton)
        uiView.addSubview(timeLabel)
        view.addSubview(uiView)
        view.addSubview(playButton)
        view.addSubview(pauseButton)
        timeLabel.text = "\(counter)"
    }
    
    @objc private func playAction() {
        if !isRunning {
            timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
            
            playButton.isEnabled = false
            pauseButton.isEnabled = true
            isRunning = true
        }
        
    }
    
    @objc private func pauseAction() {
        playButton.isEnabled = true
        pauseButton.isEnabled = false
        timer.invalidate()
        isRunning = false
    }
    
    @objc private func resetAction() {
        timer.invalidate()
        isRunning = false
        counter = 0
        timeLabel.text = "\(counter)"
        
        playButton.isEnabled = true
        pauseButton.isEnabled = false
    }
    
    @objc private func updateTime() {
        counter += 0.1
        timeLabel.text = String(format: "%.1f", counter)
    }
    
}
