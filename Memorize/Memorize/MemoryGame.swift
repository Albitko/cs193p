//
//  MemoryGame.swift
//  Memorize
//
//  Created by Alex on 19.05.2021.
//

import Foundation
import SwiftUI

struct MemoryGame <CardContent> where CardContent: Equatable{
    var cards: Array<Card>
    var themes: [Theme]
    var theme: Theme
    
    
    var indexOftheOneAndTheOnlyFaceUpCard: Int?{
        get{ cards.indices.filter { cards[$0].isFaceUp }.only }
        set{
            for index in cards.indices{
                cards[index].isFaceUp = index == newValue
            }
        }
    }
    
    mutating func choose(card: Card){
        if let chosenIndex = cards.firstIndex(matching: card), !cards[chosenIndex].isFaceUp,!cards[chosenIndex].isMatched{
            
            if let potentialMatchIndex = indexOftheOneAndTheOnlyFaceUpCard{
                if cards[chosenIndex].content == cards[potentialMatchIndex].content{
                    cards[chosenIndex].isMatched = true
                    cards[potentialMatchIndex].isMatched = true
                }
                self.cards[chosenIndex].isFaceUp = true
            }else{
                indexOftheOneAndTheOnlyFaceUpCard = chosenIndex
            }
        }
}
    
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent){
        
        cards = Array<Card>()
        themes = Array<Theme>()
        
        for pairIndex in 0..<numberOfPairsOfCards{
            cards.append(Card(
                            content: cardContentFactory(
                                Int.random(in: 0..<numberOfPairsOfCards - 1)),
                            id: pairIndex*2))
            cards.append(Card(
                            content: cardContentFactory(
                                Int.random(in: 0..<numberOfPairsOfCards - 1)),
                         id: pairIndex*2+1))
        }
    }
    
    struct Card: Identifiable{
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var content: CardContent
        var id: Int
    }
    
    struct Theme {
        var themeName: String
        var actualContent: [CardContent]
        var cardCount: Int
        var suitableColour: Color
    }
}
