//
//  EmojiArtDocumentView.swift
//  EmojiArt
//
//  Created by Alex on 10.07.2021.
//

import SwiftUI

struct EmojiArtDocumentView: View {
    @ObservedObject var document: EmojiArtDocument
    
    var body: some View {
        VStack {
            ScrollView(.horizontal){
                HStack{
                    ForEach(EmojiArtDocument.pallete.map {String($0)}, id: \.self) { emoji in
                        Text(emoji)
                            .font(Font.system(size: defaultFontSize ))
                    }
                }
            }.padding(.horizontal)
            Rectangle().foregroundColor(.yellow)
                .edgesIgnoringSafeArea([.horizontal, .bottom])
        }
    }
    
    private let defaultFontSize: CGFloat = 40
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiArtDocumentView(document: EmojiArtDocument())
    }
}
