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
        HStack{
            ForEach(EmojiArtDocument.pallete.map {String($0)}, id: \.self) { emoji in
                Text(emoji)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiArtDocumentView(document: EmojiArtDocument())
    }
}
