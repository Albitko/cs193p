//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Alex on 19.05.2021.
//

import Foundation

class EmojiMemoryGame: ObservableObject{
    
    @Published private var model: MemoryGame<String> = EmojiMemoryGame.createMemoryGame()
    static func createMemoryGame() -> MemoryGame<String>{
        let emojis: Array<String> = ["🤩","🥳","🥸","😇","😛"]
        return MemoryGame<String>(numberOfPairsOfCards: Int.random(in: 2..<6)){pairIndex in
            return emojis[pairIndex]
        }
    }
        
    // MARK: - Acces to the Model
    var cards: Array<MemoryGame<String>.Card>{
        model.cards
    }
    
    // MARK: - Large letters
    var large: Bool{
        model.isLarge
    }
    
    // MARK: - Intents
    func choose(card: MemoryGame<String>.Card){
        model.choose(card: card)
    }
}
