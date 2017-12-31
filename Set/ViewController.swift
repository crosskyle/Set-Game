//
//  ViewController.swift
//  Set
//
//  Created by Kyle Cross on 12/30/17.
//  Copyright © 2017 Kyle Cross. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let game = SetGame()
    
    
    @IBOutlet var cardButtons: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        updateViewFromModel()
        
    }
    
    func updateViewFromModel() {
        for index in game.cardsShown.indices {
            let card = game.cardsShown[index]
            
            var cardColor : UIColor {
                get {
                    switch card.color {
                    case .color1:
                        switch card.shading {
                        case .open:
                            return #colorLiteral(red: 0.5823833942, green: 0.79836303, blue: 0, alpha: 1)
                        case .solid:
                            return #colorLiteral(red: 0, green: 0.8044199347, blue: 0.06964756548, alpha: 1)
                        case.striped:
                            return #colorLiteral(red: 0, green: 0.5646210909, blue: 0.4068997502, alpha: 1)
                        }
                    case .color2:
                        switch card.shading {
                        case .open:
                            return #colorLiteral(red: 1, green: 0.2527923882, blue: 1, alpha: 1)
                        case .solid:
                            return #colorLiteral(red: 1, green: 0.7669824958, blue: 0.993640244, alpha: 1)
                        case.striped:
                            return #colorLiteral(red: 0.4012519717, green: 0.2152154148, blue: 0.8767248988, alpha: 1)
                        }
                    case .color3:
                        switch card.shading {
                        case .open:
                            return #colorLiteral(red: 1, green: 0.1491314173, blue: 0, alpha: 1)
                        case .solid:
                            return #colorLiteral(red: 0.6825292706, green: 0.270254612, blue: 0, alpha: 1)
                        case.striped:
                            return #colorLiteral(red: 1, green: 0.6448701024, blue: 0.3832321465, alpha: 1)
                        }
                    }
                }
            }
            
            var cardSymbol : String {
                get {
                    switch card.symbol {
                    case .symbol1:
                        return "▲"
                    case .symbol2:
                        return "●"
                    case .symbol3:
                        return "■"
                    }
                }
            }
            
            var cardString = cardSymbol
            
            for _ in 1..<card.number.rawValue {
                cardString += cardSymbol
            }
            
            let attributes: [NSAttributedStringKey: Any] = [
                .foregroundColor: cardColor,
            ]
            
            let attributedString = NSAttributedString(string: cardString,
                attributes: attributes)
            
            cardButtons[index].setAttributedTitle(attributedString, for: UIControlState.normal)
        }
        
        for index in game.cardsShown.count..<cardButtons.count {
            cardButtons[index].isHidden = true
        }
    }
}

