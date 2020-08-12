//
//  SoundManager.swift
//  CardGame
//
//  Created by Harun Sasmaz on 11.08.2020.
//  Copyright © 2020 Harun Sasmaz. All rights reserved.
//

import Foundation
import AVFoundation

class SoundManager {
    
    var audioPlayer:AVAudioPlayer?
    
    enum SoundEffect {
        
        case flip
        case match
        case nomatch
        case shuffle
    }
    
    func playSound(effect: SoundEffect) {
        
        var soundfile = ""
        
        switch effect
        {
            case .flip:
                soundfile = "cardflip"
            case .match:
                soundfile = "dingcorrect"
            case .nomatch:
                soundfile = "dingwrong"
            case .shuffle:
                soundfile = "shuffle"
            default:
                soundfile = ""
        }
        
        let path = Bundle.main.path(forResource: soundfile, ofType: ".wav")
        
        guard path != nil else { return }
        
        let url = URL(fileURLWithPath: path!)
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.play()
        } catch {
            print("Error while creating audio player!")
            return
        }
        
        
    }
}
