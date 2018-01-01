//
//  SetGame.swift
//  Set
//
//  Created by Kyle Cross on 12/31/17.
//  Copyright © 2017 Kyle Cross. All rights reserved.
//

import Foundation


class SetGame {
    private var deck = SetDeck()
    
    private(set) var cardsShown = [SetCard]()
    private var cardsMatched = [SetCard]()
    private(set) var selectedCards = [SetCard]()
    
    init() {
        for _ in 1...12 {
            if let card = deck.draw() {
                cardsShown.append(card)
            }
        }
    }
    
    func drawThreeCards() {
        if cardsShown.count <= 21 {
            for _ in 1...3 {
                if let card = deck.draw()  {
                    cardsShown.append(card)
                }
            }
        }
    }
    
    func selectCard(at index: Int) {
        
        if selectedCards.count < 3 {
            selectedCards.append(cardsShown[index])
            
            if selectedCards.count == 3 {
                
            }
        }
    }
}
