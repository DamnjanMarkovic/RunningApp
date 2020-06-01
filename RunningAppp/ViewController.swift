//
//  ViewController.swift
//  RunningAppp
//
//  Created by Damnjan Markovic on 01/06/2020.
//  Copyright © 2020 Damnjan Markovic. All rights reserved.
//

import UIKit
import AVFoundation
import Foundation

class ViewController: UIViewController {
    
    var player = AVAudioPlayer()
    var progress = UIProgressView()
    var timer = Timer()
    
    var runningTimes = ["Short": 5, "Medium": 10, "Long": 15]
    var totalTime = 0
    var secondsPassed = 0
    var progresNumber = 0.0
    var number: Int?
    
    @IBOutlet weak var imageShortRun: UIImageView!
    @IBOutlet weak var imageMiddleRun: UIImageView!
    @IBOutlet weak var imageLongRun: UIImageView!
    @IBOutlet weak var progressBarAppearance: UIProgressView!
    @IBOutlet weak var lblResults: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        progressBarAppearance.progress = 0.0
        progressBarAppearance.transform = CGAffineTransform(rotationAngle: .pi/2)
        
    }
    
    @IBAction func btnSelectRun(_ sender: UIButton) {
        secondsPassed = 0
        timer.invalidate()
        let length = sender.currentTitle!
        totalTime = runningTimes[length]!
        progressBarAppearance.progress = 0.0
        lblResults.text = "\(length) run"
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(timerObjC), userInfo: nil, repeats: true)
    }
    
    @objc func timerObjC(){
        
        if (secondsPassed < totalTime) {
            
            lblResults.text = "\(secondsPassed + 1) / \(totalTime)"
            secondsPassed += 1
            progressBarAppearance.progress = Float(secondsPassed) / Float(totalTime)
        } else {
            playSound()
            timer.invalidate()
            lblResults.text = "Well done!"
        }
    }
    
    
    func playSound() {
        let soundLocation = Bundle.main.url(forResource: "Done_sound", withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: soundLocation!)
        player.play()
    }
    
    
    
    
    
}

