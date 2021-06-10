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
        
        VStack {
            HStack {
                Text("Theme: \(viewModel.currentTheme.themeName)")
                    .foregroundColor(viewModel.currentTheme.suitableColour)
                Text("SCORE: ")
            }.padding()
            Grid(viewModel.cards){card in
                        CardView(card: card).onTapGesture{
                            viewModel.choose(card: card)
                        }
                        .padding(5)
                }
                //.aspectRatio(0.6, contentMode: .fit)
                .foregroundColor(viewModel.currentTheme.suitableColour)
                .padding()
            Button("New Game"){}.padding()
        }
    }
}

struct CardView: View {
    var card: MemoryGame<String>.Card
   
    
    var body: some View{
        GeometryReader(content: { geometry in
            self.body(for: geometry.size)
        })
        
        
    }
    
    func body(for size: CGSize) -> some View{
        let shape = RoundedRectangle(cornerRadius:rectCornerRadius)
        
        return ZStack{
            if card.isFaceUp{
                shape.fill(Color.white)
                shape.stroke(lineWidth: edgeLineWidth)
                Text(card.content)
            }else{
                if !card.isMatched{
                    shape.fill()
                }
            }
        }.font(Font.system(size: fontSize(for: size)))
    }
    
    //MARK: - Drawing constants
    let rectCornerRadius: CGFloat = 10.0
    let edgeLineWidth: CGFloat = 3
    let fontScaleFactor: CGFloat = 0.75
    
    func fontSize(for size: CGSize) -> CGFloat{
        min(size.width,size.height) * fontScaleFactor
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: EmojiMemoryGame())
    }
}
