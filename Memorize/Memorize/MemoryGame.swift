//
//  MemoryGame.swift
//  Memorize
//
//  Created by Alex on 19.05.2021.
//

import Foundation

struct MemoryGame <CardContent>{
    var cards: Array<Card>
    var isLarge: Bool = false
    
    mutating func choose(card: Card){
        let chosenIndex: Int = self.getIndex(of: card)
        self.cards[chosenIndex].isFaceUp = !self.cards[chosenIndex].isFaceUp
        print("card choosen \(card)")
    }
    
    func getIndex(of card: Card) -> Int{
        for index in 0..<self.cards.count{
            if self.cards[index].id == card.id{
                return index
            }
        }
        return 0 // TODO: bogus
    }
    
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent){
        cards = Array<Card>()
        
        if numberOfPairsOfCards == 5{
            isLarge = true
        }
        
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
        var isFaceUp: Bool = true
        var isMatched: Bool = false
        var content: CardContent
        var id: Int
    }
}
