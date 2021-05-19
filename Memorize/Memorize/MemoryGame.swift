//
//  MemoryGame.swift
//  Memorize
//
//  Created by Alex on 19.05.2021.
//

import Foundation

struct MemoryGame <CardContent>{
    var cards: Array<Card>
    
    func choose(card: Card){
        print("card choosen \(card)")
    }
    
    struct Card{
        var isFaceUp: Bool
        var isMatched: Bool
        var content: CardContent
    }
}
