//
//  SetGame.swift
//  Set
//
//  Created by Kyle Cross on 12/31/17.
//  Copyright © 2017 Kyle Cross. All rights reserved.
//

import Foundation

class SetGame {
    private(set) var deck = SetDeck()
    private(set) var cardsShown = [SetCard]()
    private var cardsMatched = [SetCard]()
    private(set) var cardsSelected = [SetCard]()
    private(set) var score = 0
    private(set) var cardCount = 81
    
    init() {
        for _ in 1...12 {
            if let card = deck.draw() {
                cardsShown.append(card)
            }
        }
    }
    
    func drawThreeCards() -> Bool {
        if cardsShown.count <= 21 {
            for _ in 1...3 {
                if let card = deck.draw()  {
                    cardsShown.append(card)
                }
            }
            return true
        }
        return false
    }
    
    func selectCard(at index: Int) {
        
        if cardsSelected.count < 3 {
            cardsSelected.append(cardsShown[index])
            
            if cardsSelected.count == 3 {
                cardsMakeSet()
            }
        }
    }
    
    func cardsMakeSet() {
        
        if cardsSelected[0].color == cardsSelected[1].color && cardsSelected[0].color == cardsSelected[2].color { }
            
        else if cardsSelected[0].color != cardsSelected[1].color && cardsSelected[0].color != cardsSelected[2].color && cardsSelected[1].color != cardsSelected[2].color { }
            
        else {
            removeFromCardsSelected(isMatched: false)
            score -= 5
            return
        }
    
        if cardsSelected[0].number == cardsSelected[1].number && cardsSelected[0].number == cardsSelected[2].number { }
            
        else if cardsSelected[0].number != cardsSelected[1].number && cardsSelected[0].number != cardsSelected[2].number && cardsSelected[1].number != cardsSelected[2].number { }
            
        else {
            removeFromCardsSelected(isMatched: false)
            score -= 5
            return
        }
        
        if cardsSelected[0].shading == cardsSelected[1].shading && cardsSelected[0].shading == cardsSelected[2].shading { }
            
        else if cardsSelected[0].shading != cardsSelected[1].shading && cardsSelected[0].shading != cardsSelected[2].shading && cardsSelected[1].shading != cardsSelected[2].shading { }
            
        else {
            removeFromCardsSelected(isMatched: false)
            score -= 5
            return
        }
        
        if cardsSelected[0].symbol == cardsSelected[1].symbol && cardsSelected[0].symbol == cardsSelected[2].symbol { }
            
        else if cardsSelected[0].symbol != cardsSelected[1].symbol && cardsSelected[0].symbol != cardsSelected[2].symbol && cardsSelected[1].symbol != cardsSelected[2].symbol { }
            
        else {
            removeFromCardsSelected(isMatched: false)
            return
        }
        
        removeFromCardsSelected(isMatched: true)
        score += 2
        
    }
    
    func removeFromCardsSelected(isMatched: Bool) {
        for _ in cardsSelected {
            if let card = cardsSelected.popLast() {
                if isMatched {
                    cardsMatched.append(card)
                    
                    if let index = cardsShown.index(of: card) {
                        cardsShown.remove(at: index)
                        cardCount -= 1
                    }
                }
            }
        }
    }
    
}
