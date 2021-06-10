//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Alex on 19.05.2021.
//

import Foundation
import SwiftUI

class EmojiMemoryGame: ObservableObject{
    
    static let emojiTheme = MemoryGame.Theme(themeName: "First",actualContent: ["🤩","🥳","🥸","😇","😛"], cardCount: 4, suitableColour: Color.orange)
    
    static let thingsTheme = MemoryGame.Theme(themeName: "Things",actualContent: ["🩴","👕","🪖","💼","👛","🦺"], cardCount: 6, suitableColour: Color.blue)
    
    static let themesStorage: [MemoryGame<String>.Theme] = [emojiTheme, thingsTheme]
    
    @Published private var model: MemoryGame<String> = EmojiMemoryGame.createMemoryGame(themesNumber: 1)
    
    
    static func createMemoryGame(themesNumber: Int) -> MemoryGame<String>{
        return MemoryGame<String>(themes: themesStorage, theme: themesStorage[themesNumber])
    }
        
    // MARK: - Acces to the Model
    var cards: Array<MemoryGame<String>.Card>{
        model.cards
    }
    
    
    // MARK: - Intents
    func choose(card: MemoryGame<String>.Card){
        model.choose(card: card)
    }
    
    func newGame(){
        //model = EmojiMemoryGame.createMemoryGame(themesNumber: 0)
    }
    
    
    var themeStorage: [MemoryGame<String>.Theme]{
        model.themes
    }
    
    var currentTheme: MemoryGame<String>.Theme{
        model.theme
    }
    
    var score: Int{
        model.score
    }
}
