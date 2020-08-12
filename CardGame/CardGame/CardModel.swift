//
//  CardModel.swift
//  CardGame
//
//  Created by Harun Sasmaz on 11.08.2020.
//  Copyright © 2020 Harun Sasmaz. All rights reserved.
//

import Foundation

class CardModel {
    
    func getCards() -> [Card] {
        
        var generatedNumbers = [Int]()
        var generateCards = [Card]()
        
        while generatedNumbers.count < 8 {
            
            let random = Int.random(in: 1...13)
            
            if generatedNumbers.contains(random) == false
            {
                let cardOne = Card()
                let cardTwo = Card()
                
                cardOne.imageName = "card\(random)"
                cardTwo.imageName = "card\(random)"
                
                generateCards += [cardTwo, cardOne]
                generatedNumbers.append(random)
            }
        }
        
        generateCards.shuffle()
        return generateCards
    }
    
}
