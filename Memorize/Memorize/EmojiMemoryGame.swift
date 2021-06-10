//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Alex on 19.05.2021.
//

import Foundation
import SwiftUI

class EmojiMemoryGame: ObservableObject{
    
    static let emojiTheme = MemoryGame.Theme(themeName: "First",actualContent: ["🤩","🥳","🥸","😇","😛"], cardCount: 4, suitableColour: Color.blue)
    
    static let thingsTheme = MemoryGame.Theme(themeName: "Things",actualContent: ["🩴","👕","🪖","💼","👛","🦺"], cardCount: 6, suitableColour: Color.orange)
    
    let themesStorage: [MemoryGame<String>.Theme] = [emojiTheme, thingsTheme]
    
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
    
    
    // MARK: - Intents
    func choose(card: MemoryGame<String>.Card){
        model.choose(card: card)
    }
    
    
    var themeStorage: [MemoryGame<String>.Theme]{
        model.themes
    }
    
    var currentTheme: MemoryGame<String>.Theme{
        model.theme
    }
}
