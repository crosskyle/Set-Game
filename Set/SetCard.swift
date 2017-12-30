//
//  SetCard.swift
//  Set
//
//  Created by Kyle Cross on 12/30/17.
//  Copyright © 2017 Kyle Cross. All rights reserved.
//

import Foundation

struct SetCard {

    var number: Number
    var symbol: Symbol
    var shading: Shading
    var color: Color
    
    enum Number {
        case one
        case two
        case three
        
        static var all = [Number.one,.two,.three]
    }
    
    enum Symbol: String {
        case triangle = "▲"
        case square = "■"
        case circle = "●"
        
        static var all = [Symbol.triangle,.square,.circle]
    }
    
    enum Shading {
        case solid
        case striped
        case open
        
        static var all = [Shading.solid,.striped,.open]
    }
    
    enum Color {
        case red
        case green
        case purple
        
        static var all = [Color.red,.green,.purple]

    }
}

extension SetCard: CustomStringConvertible {
    
    var description: String {
        return "\(number), \(symbol.rawValue), \(shading), \(color)"
    }
}
