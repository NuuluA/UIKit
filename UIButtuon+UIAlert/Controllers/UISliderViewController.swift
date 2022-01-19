//
//  UISliderViewController.swift
//  UIButtuon+UIAlert
//
//  Created by Арген on 19.01.2022.
//

import UIKit
import AVFoundation

class UISliderViewController: UIViewController {
    
    //Обявляем UI элемент
    var button = UIButton()
    var button2 = UIButton()
    var slider = UISlider()
    var player = AVAudioPlayer()
    var volume = UISlider()

    override func viewDidLoad() {
        super.viewDidLoad()

        creatButton()
        
        //Добавляем на экран
        view.addSubview(button)
        view.addSubview(button2)
        view.addSubview(slider)
        view.addSubview(volume)
        
        //Добавлям музыку
        do {
            if let audio = Bundle.main.path(forResource: "music", ofType: "mp3") {
                try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: audio))
                slider.maximumValue = Float(player.duration)
            }
        } catch {
            fatalError()
            
        }
    }
    
    private func creatButton() {
        button.backgroundColor = .darkGray
        button.setTitle("Play", for: .normal)
        button.layer.cornerRadius = 10
        button.frame = CGRect(x: 50, y: 600, width: 150, height: 30)
        button.addTarget(self, action: #selector(playMusic), for: .touchUpInside)
        
        button2.backgroundColor = .darkGray
        button2.setTitle("Pause", for: .normal)
        button2.layer.cornerRadius = 10
        button2.frame = CGRect(x: 200, y: 600, width: 150, height: 30)
        button2.addTarget(self, action: #selector(pauseMusic), for: .touchUpInside)
        
        slider.center = view.center
        slider.minimumValue = 0.0
        slider.maximumValue = 100.0
        slider.thumbTintColor = .gray
        slider.addTarget(self, action: #selector(changeMusic), for: .valueChanged)
        
        volume.frame = CGRect(x: 100, y: 150, width: 150, height: 30)
        volume.minimumValue = 0.0
        volume.maximumValue = 100.0
        volume.thumbTintColor = .red
        volume.addTarget(self, action: #selector(changeVolume), for: .valueChanged)
    }
    
    @objc private func changeVolume() {
        player.volume = volume.value
    }
    
    @objc private func changeMusic() {
        //Перемотка, перематываем музыку
        player.currentTime = TimeInterval(slider.value)
    }
    
    @objc private func playMusic() {
        player.play()
    }
    
    @objc private func pauseMusic() {
        player.pause()
    }

}
