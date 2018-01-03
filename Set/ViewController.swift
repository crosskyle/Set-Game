//
//  ViewController.swift
//  Set
//
//  Created by Kyle Cross on 12/30/17.
//  Copyright © 2017 Kyle Cross. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private let game = SetGame()
    
    @IBOutlet var cardButtons: [UIButton]!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBAction func touchDrawCardsButton(_ sender: UIButton) {
        if game.drawThreeCards() {
            updateViewFromModel()
        }
    }
    
    @IBAction func touchCard(_ sender: UIButton) {
        if game.cardsSelected.count < 3 {
            sender.layer.borderWidth = 3.0
            sender.layer.borderColor = UIColor.blue.cgColor
            sender.layer.cornerRadius = 8.0
            
            if let cardNumber = cardButtons.index(of: sender) {
                game.selectCard(at: cardNumber)
                updateViewFromModel()
            } else {
                print("choosen card was not in cardButtons")
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateViewFromModel()
    }
    
    func updateViewFromModel() {
        
        scoreLabel.text = "\(game.score)"
        
        for index in game.cardsShown.indices {
            let card = game.cardsShown[index]
            
            var cardColor : UIColor {
                get {
                    switch card.color {
                    case .color1:
                        switch card.shading {
                        case.striped:
                            return #colorLiteral(red: 0, green: 0.8044199347, blue: 0.06964756548, alpha: 1).withAlphaComponent(0.15)
                        default:
                            return #colorLiteral(red: 0, green: 0.8044199347, blue: 0.06964756548, alpha: 1)
                        }
                    case .color2:
                        switch card.shading {
                        case.striped:
                            return #colorLiteral(red: 0.4012519717, green: 0.2152154148, blue: 0.8767248988, alpha: 1).withAlphaComponent(0.15)
                        default:
                            return #colorLiteral(red: 0.4012519717, green: 0.2152154148, blue: 0.8767248988, alpha: 1)
                        }
                    case .color3:
                        switch card.shading {
                        case.striped:
                            return #colorLiteral(red: 1, green: 0.1491314173, blue: 0, alpha: 1).withAlphaComponent(0.15)
                        default:
                            return #colorLiteral(red: 1, green: 0.1491314173, blue: 0, alpha: 1)
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
                .strokeWidth: card.shading == .open ? 5.0 : -0.1
            ]
            
            let attributedString = NSAttributedString(string: cardString, attributes: attributes)
            
            if game.cardsSelected.contains(card) {
                cardButtons[index].layer.borderWidth = 3.0
                cardButtons[index].layer.borderColor = UIColor.blue.cgColor
                cardButtons[index].layer.cornerRadius = 8.0
            }
            else {
                cardButtons[index].layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.6000000238)
            }
            
            cardButtons[index].backgroundColor = #colorLiteral(red: 0.9372549057, green: 0.9372549057, blue: 0.9568627477, alpha: 1)
            cardButtons[index].setAttributedTitle(attributedString, for: UIControlState.normal)
            cardButtons[index].isEnabled = true
        }
        
        for index in game.cardsShown.count..<cardButtons.count {
            cardButtons[index].layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.6000000238)
            cardButtons[index].backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            cardButtons[index].setTitle(nil, for: UIControlState.normal)
            cardButtons[index].setAttributedTitle(nil, for: UIControlState.normal)
            cardButtons[index].isEnabled = false
        }
    }
}

