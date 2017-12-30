//
//  ViewController.swift
//  Set
//
//  Created by Kyle Cross on 12/30/17.
//  Copyright © 2017 Kyle Cross. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var deck = SetDeck()
    
    @IBOutlet var cardButtons: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for _ in 0..<81 {
            if let card = deck.draw() {
                print("\(card)")
            }
        }
    }
}

