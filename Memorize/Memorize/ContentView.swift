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
                    .multilineTextAlignment(.leading)
                    .padding(.trailing)
                Text("SCORE: \(viewModel.score)")
            }.padding()
            Grid(viewModel.cards){card in
                        CardView(card: card).onTapGesture{
                            withAnimation(.linear(duration: 0.75)){
                                viewModel.choose(card: card)
                            }
                        }
                        .padding(5)
                }
                //.aspectRatio(0.6, contentMode: .fit)
                .foregroundColor(viewModel.currentTheme.suitableColour)
                .padding()
            Button("New Game"){
                withAnimation(.easeInOut){
                    viewModel.newGame()
                }
            }.padding()
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
    
    @ViewBuilder
    private func body(for size: CGSize) -> some View{
        if card.isFaceUp || !card.isMatched{
            ZStack{
                Pie(startAngle: Angle.degrees(0-90), endAngle: Angle.degrees(110-90))
                    .padding(5)
                    .opacity(0.4)
                Text(card.content)
                    .font(Font.system(size: fontSize(for: size)))
                    .rotationEffect(Angle.degrees(card.isMatched ? 360 : 0))
                    .animation(card.isMatched ? Animation.linear.repeatForever(autoreverses: false) : .default)
            }
            .cardify(isFaceUp: card.isFaceUp)
            .transition(AnyTransition.scale)
            
        }
    }
    
    //MARK: - Drawing constants
    
    private let fontScaleFactor: CGFloat = 0.7
    
    private func fontSize(for size: CGSize) -> CGFloat{
        min(size.width,size.height) * fontScaleFactor
    }
}

struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        ContentView(viewModel: EmojiMemoryGame())
    }
}
