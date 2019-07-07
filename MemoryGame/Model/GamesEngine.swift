//
//  GamesEngine.swift
//  MemoryGame
//
//  Created by Lukasz on 07/07/2019.
//  Copyright © 2019 Lukasz. All rights reserved.
//

import Foundation

class Engine {
    
    private(set) var cards: [Card] = []
    
    // MARK: Two matching cards added into the array
    
    init(numberOfCardsPairs: Int) {
        for _ in 1...numberOfCardsPairs {
            let card = Card()
            cards += [card, card]
        }
        cards.shuffle()
    }
}
