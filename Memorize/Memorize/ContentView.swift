//
//  ContentView.swift
//  Memorize
//
//  Created by Alex on 08.05.2021.
//

import SwiftUI

struct ContentView: View {
    var viewModel: EmojiMemoryGame
    var body: some View {
        if(viewModel.large){
            HStack {
                ForEach(viewModel.cards){card in
                    CardView(card: card).onTapGesture{
                        viewModel.choose(card: card)
                    }
                }
            }
            .foregroundColor(.orange)
            .padding()
            .font(Font.largeTitle)
        }else{
            HStack {
                ForEach(viewModel.cards){card in
                    CardView(card: card).onTapGesture{
                        viewModel.choose(card: card)
                    }
                }
            }
            .foregroundColor(.orange)
            .padding()
            .font(Font.title)
        }
        
    }
}

struct CardView: View {
    var card: MemoryGame<String>.Card
    var isFaceUp: Bool = false
    var body: some View{
        ZStack{
            if card.isFaceUp{
                RoundedRectangle(cornerRadius: 10.0)
                    .fill(Color.white)
                RoundedRectangle(cornerRadius: 10.0)
                    .stroke(lineWidth: 3.0)
                Text(card.content)
            }else{
                RoundedRectangle(cornerRadius: 10.0)
                    .fill()
            }
            
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: EmojiMemoryGame())
    }
}
