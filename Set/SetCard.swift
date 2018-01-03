//
//  SetCard.swift
//  Set
//
//  Created by Kyle Cross on 12/30/17.
//  Copyright © 2017 Kyle Cross. All rights reserved.
//

import Foundation
import UIKit

struct SetCard {

    var number: Number
    var symbol: Symbol
    var shading: Shading
    var color: Color
    private var identifier: Int
    private static var identifierFactory = 0
    
    private static func getUniqueIdentifier() -> Int {
        identifierFactory += 1
        return identifierFactory
    }
    
    init(number: Number, symbol: Symbol, shading: Shading, color: Color) {
        self.number = number
        self.symbol = symbol
        self.shading = shading
        self.color = color
        self.identifier = SetCard.getUniqueIdentifier()
    }
    
    enum Number: Int {
        case one = 1
        case two = 2
        case three = 3
        
        static var all = [Number.one,.two,.three]
    }
    
    enum Symbol: String {
        case symbol1
        case symbol2
        case symbol3
        
        static var all = [Symbol.symbol1,.symbol2,.symbol3]
    }
    
    enum Shading {
        case solid
        case striped
        case open
        
        static var all = [Shading.solid,.striped,.open]
    }
    
    enum Color {
        case color1
        case color2
        case color3
        
        static var all = [Color.color1,.color2,.color3]

    }
}

extension SetCard: CustomStringConvertible {
    
    var description: String {
        return "\(number), \(symbol.rawValue), \(shading), \(color)"
    }
}

extension SetCard: Equatable {
    static func ==(lhs: SetCard, rhs: SetCard) -> Bool {
        return lhs.identifier == rhs.identifier
    }
}

