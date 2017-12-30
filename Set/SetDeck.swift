//
//  SetDeck.swift
//  Set
//
//  Created by Kyle Cross on 12/30/17.
//  Copyright © 2017 Kyle Cross. All rights reserved.
//

import Foundation

struct SetDeck {
    
    private(set) var cards = [SetCard]()
    
    init() {
        for number in SetCard.Number.all {
            for symbol in SetCard.Symbol.all {
                for shading in SetCard.Shading.all {
                    for color in SetCard.Color.all {
                        cards.append(SetCard(number: number, symbol: symbol, shading: shading, color: color))
                    }
                }
            }
        }
    }
    
    mutating func draw() -> SetCard? {
        if cards.count > 0 {
            return cards.remove(at: cards.count.random)
        }
        else {
            return nil
        }
    }
    
}

extension Int {
    var random: Int {
        if self > 0 {
            return Int(arc4random_uniform(UInt32(self)))
        }
        else if self < 0 {
            return -Int(arc4random_uniform(UInt32(-self)))
        }
        else {
            return 0
        }
    }
}

