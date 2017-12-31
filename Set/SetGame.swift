//
//  SetGame.swift
//  Set
//
//  Created by Kyle Cross on 12/31/17.
//  Copyright © 2017 Kyle Cross. All rights reserved.
//

import Foundation


class SetGame {
    var deck = SetDeck()
    
    var cardsShown = [SetCard]()
    var cardsMatched = [SetCard]()
    
    init() {
        for _ in 1...12 {
            if let card = deck.draw() {
                cardsShown.append(card)
            }
        }
    }
}
