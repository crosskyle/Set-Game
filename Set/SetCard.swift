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

    let number: Number
    let symbol: Symbol
    let shading: Shading
    let color: Color
    
    var enumValues: [Int] {
        return [number.rawValue, symbol.rawValue, shading.rawValue, color.rawValue]
    }
    
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
        case two
        case three
        
        static var all = [Number.one,.two,.three]
    }
    
    enum Symbol: Int {
        case symbol1 = 1
        case symbol2
        case symbol3
        
        static var all = [Symbol.symbol1,.symbol2,.symbol3]
    }
    
    enum Shading: Int {
        case solid = 1
        case striped
        case open
        
        static var all = [Shading.solid,.striped,.open]
    }
    
    enum Color: Int {
        case color1 = 1
        case color2
        case color3
        
        static var all = [Color.color1,.color2,.color3]

    }
}

extension SetCard: CustomStringConvertible {
    
    var description: String {
        return "\(number), \(symbol), \(shading), \(color)"
    }
}

extension SetCard: Equatable {
    static func ==(lhs: SetCard, rhs: SetCard) -> Bool {
        return lhs.identifier == rhs.identifier
    }
}

