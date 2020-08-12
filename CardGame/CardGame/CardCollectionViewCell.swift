//
//  CardCollectionViewCell.swift
//  CardGame
//
//  Created by Harun Sasmaz on 11.08.2020.
//  Copyright © 2020 Harun Sasmaz. All rights reserved.
//

import UIKit

class CardCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var frontimageView: UIImageView!
    @IBOutlet weak var backImageView: UIImageView!
    
    var card: Card?
    
    func configureCell(card: Card) {
        
        self.card = card
        frontimageView.image = UIImage(named: card.imageName)
        
        if card.isMatched == true {
            backImageView.alpha = 0
            frontimageView.alpha = 0
            return
        } else {
            backImageView.alpha = 1
            frontimageView.alpha = 1
        }
        
        if card.isFlipped == true {
            flipUp(time: 0)
        } else {
            flipDown(time: 0, delay: 0)
        }
    }
    
    func flipUp(time: TimeInterval = 0.3) {
        UIView.transition(from: backImageView, to: frontimageView, duration: time, options: [.showHideTransitionViews,.transitionFlipFromLeft])
        card?.isFlipped = true
    }
    
    func flipDown(time: TimeInterval = 0.3, delay: TimeInterval = 0.5) {
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + delay) {
            UIView.transition(from: self.frontimageView, to: self.backImageView, duration: time, options: [.showHideTransitionViews,.transitionFlipFromLeft])
        }
        
        card?.isFlipped = false
    }
    
    func remove() {
        
        backImageView.alpha = 0
        
        UIView.animate(withDuration: 0.3, delay: 0.5, options: .curveEaseOut, animations: {
            self.frontimageView.alpha = 0
        }, completion: nil)
        
    }
}
