//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Alex on 19.05.2021.
//

import Foundation

class EmojiMemoryGame{
    
    private var model: MemoryGame<String> = EmojiMemoryGame.createMemoryGame()
    static func createMemoryGame() -> MemoryGame<String>{
        let emojis: Array<String> = ["🤩","🥳","🥸"]
        return MemoryGame<String>(numberOfPairsOfCards: emojis.count){pairIndex in
            return emojis[pairIndex]
        }
    }
    
    // MARK: - Acces to the Model
    var cards: Array<MemoryGame<String>.Card>{
        model.cards
    }
    
    // MARK: - Intents
    func choose(card: MemoryGame<String>.Card){
        model.choose(card: card)
    }
}
