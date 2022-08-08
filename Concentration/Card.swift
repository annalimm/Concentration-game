//
//  Card.swift
//  Concentration
//
//  Created by Anna Merkushina on 05.08.2022.
//

import Foundation


struct Card {
    
    var isFaceUp = false
    var isMatched = false
    var identifier: Int
    
    static var idintifierFactory = 0
    
    static func getUnicIdentifier() -> Int {
        idintifierFactory += 1
        return idintifierFactory
    }
    
    init() {
        self.identifier = Card.getUnicIdentifier()
    }
}
