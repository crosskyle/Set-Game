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
    private(set) var cardsDisplayed = [SetCard]()
    private(set) var cardsSelected = [SetCard]()
    private(set) var score = 0
    private(set) var cardCount = 81
    let MATCH = 3
    let MISMATCH = -5
    
    init() {
        for _ in 1...12 {
            if let card = deck.draw() {
                cardsDisplayed.append(card)
            }
        }
    }
    
    func drawThreeCards() -> Bool {
        if cardsDisplayed.count <= 21 {
            for _ in 1...3 {
                if let card = deck.draw()  {
                    cardsDisplayed.append(card)
                }
            }
            return true
        }
        return false
    }
    
    func selectCard(at index: Int) {
        if cardsSelected.count < 3 {
            cardsSelected.append(cardsDisplayed[index])
            
            if cardsSelected.count == 3 {
                cardsMakeSet()
            }
        }
    }
    
    func cardsAreDifferent(at k: Int) -> Bool {
        for i in 0..<cardsSelected.count-1 {
            for j in i+1..<cardsSelected.count {
                if cardsSelected[i].enumValues[k] == cardsSelected[j].enumValues[k] {
                    return false
                }
            }
        }
        return true
    }
    
    func cardsAreSame(at k: Int) -> Bool {
        return cardsSelected.reduce(true, { $0 && ($1.enumValues[k] == cardsSelected[0].enumValues[k]) })
    }
    
    func cardsMakeSet() {
        for k in 0..<cardsSelected[0].enumValues.count {
            if cardsAreDifferent(at: k) || cardsAreSame(at: k){}
            else {
                removeFromCardsSelectedAndCardsShownIf(isMatched: false)
                score += MISMATCH
                return
            }
        }
        removeFromCardsSelectedAndCardsShownIf(isMatched: true)
        score += MATCH
    }
    
    func removeFromCardsSelectedAndCardsShownIf(isMatched: Bool) {
        for _ in cardsSelected {
            guard let card = cardsSelected.popLast() else { return }
            
            if isMatched, let index = cardsDisplayed.index(of: card) {
                cardsDisplayed.remove(at: index)
                cardCount -= 1
            }
        }
    }
}
