//
//  ViewControllerPlayer.swift
//  RockMusicPlayer
//
//  Created by Preferiti_mac on 28.07.18.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit
import MediaPlayer

class ViewControllerPlayer: UIViewController {
    
    var musicPlayer = MPMusicPlayerController.applicationMusicPlayer
    
    @IBOutlet weak var MDMButton: UIButton!
    @IBOutlet weak var HRButton: UIButton!
    @IBOutlet weak var HMButton: UIButton!
    @IBOutlet weak var StopButton: UIButton!
    @IBOutlet weak var NextButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.buttonsSetup()
    }
    
    //MARK: Button Actions
    
    @IBAction func ganreButton(_ sender: UIButton) {
        MPMediaLibrary.requestAuthorization { (status) in
            if status == .authorized {
                DispatchQueue.main.async {
                    self.playGanre(ganre: sender.currentTitle!)
                }
            }
        }
    }
    
    @IBAction func stopButton(_ sender: UIButton) {
        musicPlayer.stop()
    }
    
    @IBAction func nextButton(_ sender: UIButton) {
        musicPlayer.skipToNextItem()
    }
    
    //MARK: Metods
    
    func buttonsSetup() {
        MDMButton.layer.cornerRadius = 10
        MDMButton.layer.borderWidth = 1
        MDMButton.layer.borderColor = UIColor.white.cgColor
        HRButton.layer.cornerRadius = 10
        HRButton.layer.borderWidth = 1
        HRButton.layer.borderColor = UIColor.white.cgColor
        HMButton.layer.cornerRadius = 10
        HMButton.layer.borderWidth = 1
        HMButton.layer.borderColor = UIColor.white.cgColor
        StopButton.layer.cornerRadius = 10
        StopButton.layer.borderWidth = 1
        StopButton.layer.borderColor = UIColor.white.cgColor
        NextButton.layer.cornerRadius = 10
        NextButton.layer.borderWidth = 1
        NextButton.layer.borderColor = UIColor.white.cgColor
    }
    
    func playGanre(ganre: String) {
        musicPlayer.stop()
        let query = MPMediaQuery()
        let predicate = MPMediaPropertyPredicate(value: ganre, forProperty: MPMediaItemPropertyGenre)
        query.addFilterPredicate(predicate)
        musicPlayer.setQueue(with: query)
        musicPlayer.shuffleMode = .songs
        musicPlayer.play()
    }
}
