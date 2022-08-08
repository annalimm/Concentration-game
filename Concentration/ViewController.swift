//
//  ViewController.swift
//  Concentration
//
//  Created by Anna Merkushina on 05.08.2022.
//

import UIKit

class ViewController: UIViewController {

    lazy var game = Concentration(numberOfPairsOfCards: (cardButtons.count + 1) / 2)
    
    var flipCount = 0 {
        didSet {
            FlipCountLabel.text = "Flips: \(flipCount)"
        }
    }

    @IBOutlet weak var FlipCountLabel: UILabel!
    
    @IBOutlet var cardButtons: [UIButton]!
    
    @IBAction func touchCard(_ sender: UIButton) {
        flipCount += 1
        if let cardNumber = cardButtons.firstIndex(of: sender) {
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
        } else {
            print("choosen card is not in cardButtons")
        }
    }
    

    func updateViewFromModel() {
        for index in cardButtons.indices {
            
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFaceUp {
                button.setTitle(emoji(for: card), for: UIControl.State.normal)
                button.backgroundColor = UIColor.white
            } else {
                button.setTitle("", for: UIControl.State.normal)
                button.backgroundColor = card.isMatched ? UIColor.clear : UIColor.orange           }
        }
    }
    
    
    var emojiChoises = ["🚴🏿‍♂️","⛱","⛸","⚾️","🥶","🛣","🦢"]
    
    var emoji = [Int:String]()
    
    func emoji(for card: Card) -> String {
        if emoji[card.identifier] == nil, emojiChoises.count > 0 {
            let randomIndex = Int(arc4random_uniform(UInt32(emojiChoises.count)))
            emoji[card.identifier] = emojiChoises.remove(at: randomIndex)
            
        }
//        if emoji[card.identifier] != nil {
//            return emoji[card.identifier]!
//        } else {
//            return "?"
//        }
        return emoji[card.identifier] ?? "?"
    }
 }

