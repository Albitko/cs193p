//
//  MemoryGame.swift
//  Memorize
//
//  Created by Alex on 19.05.2021.
//

import Foundation
import SwiftUI

struct MemoryGame <CardContent> where CardContent: Equatable{
    private(set) var cards: Array<Card>
    var themes: [Theme]
    var theme: Theme
    var score: Int = 0
    
    
    private var indexOftheOneAndTheOnlyFaceUpCard: Int?{
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
                    score += 2
                }else{
                    score -= 1
                }
                self.cards[chosenIndex].isFaceUp = true
            }else{
                indexOftheOneAndTheOnlyFaceUpCard = chosenIndex
            }
        }
}
    
    init(themes themesStored: [Theme], theme currentTheme: Theme){
        
        cards = Array<Card>()
        themes = themesStored
        theme = currentTheme
        
        for pairIndex in 0..<theme.cardCount{
            cards.append(Card(content: theme.actualContent[Int.random(in: 0..<theme.cardCount - 1)], id: pairIndex*2))
            cards.append(Card(content: theme.actualContent[Int.random(in: 0..<theme.cardCount - 1)], id: pairIndex*2+1))
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
    
    
    // MARK: - Bonus Time
    
    var bonusTimeLimit: TimeInterval = 6
    
    private var faceUpTime: TimeInterval {
        if let lastFaceUpDate = self.lastFaceUpDate {
            return pastFaceUpTime + Date().timeIntervalSince(lastFaceUpDate)
        }else{
            return pastFaceUpTime
        }
    }
    
    var lastFaceUpDate: Date?
    var pastFaceUpTime: TimeInterval = 0
    
    var bonusTimeRemaining: TimeInterval {
        max(0, bonusTimeLimit - faceUpTime)
    }
    
    var bonusRemaining: Double {
        (bonusTimeLimit > 0 && bonusTimeRemaining > 0) ? bonusTimeRemaining/bonusTimeLimit : 0
    }
    
    var hasEarnedBonus: Bool {
        isMatched && bonusTimeRemaining > 0
    }
    
    var isConsumingBonusTime: Bool {
        isFaceUp && !isMatched && bonusTimeRemaining > 0
    }
    
    private mutating func startUsingBonusTime() {
        if isConsumingBonusTime, lastFaceUpDate == nil{
            lastFaceUpDate = Date()
        }
    }
    
    private mutating func stopUsingBonusTime() {
        pastFaceUpTime = faceUpTime
        self.lastFaceUpDate = nil
    }
}
