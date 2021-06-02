//
//  ContentView.swift
//  Memorize
//
//  Created by Alex on 08.05.2021.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: EmojiMemoryGame
    
    var body: some View {
            HStack {
                ForEach(viewModel.cards){card in
                    CardView(card: card).onTapGesture{
                        viewModel.choose(card: card)
                    }
                }
            }
            .aspectRatio(0.6, contentMode: .fit)
            .foregroundColor(.orange)
            .padding()
            .font(viewModel.large ? Font.largeTitle : Font.title)
        
    }
}

struct CardView: View {
    var card: MemoryGame<String>.Card
    var isFaceUp: Bool = false
    let shape = RoundedRectangle(cornerRadius: 10.0)
    var body: some View{
        ZStack{
            if card.isFaceUp{
                shape.fill(Color.white)
                shape.stroke(lineWidth: 3.0)
                Text(card.content)
            }else{
                shape.fill()
            }
            
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: EmojiMemoryGame())
    }
}
