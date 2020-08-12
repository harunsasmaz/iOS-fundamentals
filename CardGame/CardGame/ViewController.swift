//
//  ViewController.swift
//  CardGame
//
//  Created by Harun Sasmaz on 11.08.2020.
//  Copyright © 2020 Harun Sasmaz. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var timeLabel: UILabel!
    
    var firstFlippedIndex : IndexPath?
    var timer: Timer?
    var miliseconds:Int = 30 * 1000
    
    let model = CardModel()
    var cardsArray = [Card]()
    
    var soundPlayer = SoundManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cardsArray = model.getCards()
        collectionView.dataSource = self
        collectionView.delegate = self
        
        timer = Timer.scheduledTimer(timeInterval: 0.001, target: self, selector: #selector(timerFired), userInfo: nil, repeats: true)
        RunLoop.main.add(timer!, forMode: .common)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        soundPlayer.playSound(effect: .shuffle)
    }
    
    @objc func timerFired() {
        
        miliseconds -= 1
        
        let seconds:Double = Double(miliseconds)/1000.0
        timeLabel.text = String(format: "Time Remaining: %.2f", seconds)
        
        if miliseconds == 0 {
            
            timeLabel.textColor = UIColor.red
            timer?.invalidate()
            
            checkForGameEnd()
        }
        
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       
        return cardsArray.count
    }
   
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CardCell", for: indexPath) as! CardCollectionViewCell
       
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        
        let card = cardsArray[indexPath.row]
        let newcell = cell as? CardCollectionViewCell
        newcell?.configureCell(card: card)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if miliseconds <= 0 {
            return
        }
        
        let cell = collectionView.cellForItem(at: indexPath) as? CardCollectionViewCell
        
        if cell?.card?.isFlipped == false && cell?.card?.isMatched == false {
            
            cell?.flipUp()
            soundPlayer.playSound(effect: .flip)
            
            if firstFlippedIndex == nil {
                firstFlippedIndex = indexPath
            } else {
                checkMatch(indexPath)
            }
        }
        
    }
    
    func checkMatch(_ secondIndexPath: IndexPath){
        
        let cardOne = cardsArray[firstFlippedIndex!.row]
        let cardTwo = cardsArray[secondIndexPath.row]
        
        let firstCell = collectionView.cellForItem(at: firstFlippedIndex!) as? CardCollectionViewCell
        let secondCell = collectionView.cellForItem(at: secondIndexPath) as? CardCollectionViewCell
        
        if cardOne.imageName == cardTwo.imageName {
            
            soundPlayer.playSound(effect: .match)
            
            cardOne.isMatched = true
            cardTwo.isMatched = true
            
            firstCell?.remove()
            secondCell?.remove()
            
            checkForGameEnd()
            
        } else {
            
            soundPlayer.playSound(effect: .nomatch)
            
            cardOne.isFlipped = false
            cardTwo.isFlipped = false
            
            firstCell?.flipDown()
            secondCell?.flipDown()
            
        }
        
        firstFlippedIndex = nil
    }
    
    func checkForGameEnd() {
        
        var win = true
        
        for card in cardsArray {
            if card.isMatched == false {
                win = false
                break
            }
        }
        
        if win {
            self.showAlert(title: "Congrats!", msg: "You have found all the pairs!")
            timer?.invalidate()
        } else {
            if miliseconds <= 0 {
                self.showAlert(title: "Game Over!", msg: "Your time is up, better luck next time!")
            }
        }
    }
    
    func showAlert(title: String, msg: String) {
        
        let alert = UIAlertController(title: title, message: msg, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
}

