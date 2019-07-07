//
//  Card.swift
//  MemoryGame
//
//  Created by Lukasz on 07/07/2019.
//  Copyright © 2019 Lukasz. All rights reserved.
//

import Foundation

struct Card {
    
    var isSelected = false
    var isMatched = false
    var cardId: Int
    
    private static var id = 0
    
    private static func returnIdForCard() -> Int {
        id += 1
        return id
    }
    
    init() {
        self.cardId = Card.returnIdForCard()
    }
    
}
