//
//  EmojiArtDocument.swift
//  EmojiArt
//
//  Created by Alex on 10.07.2021.
//

import SwiftUI

class EmojiArtDocument: ObservableObject{
    static let pallete: String = "🦁🐝🦋🐸"
    
    @Published private var emojiArt: EmojiArt = EmojiArt()
    
    //MARK: - Intent(s)
    func addEmoji(_ emoji: String, at location: CGPoint, size: CGFloat){
        emojiArt.addEmoji(emoji, x: Int(location.x), y: Int(location.y), size: Int(size))
    }
    
    func moveEmoji(_ emoji: EmojiArt.Emoji, by offset: CGSize){
        if let index = emojiArt.emojis.firstIndex(matching: emoji){
            emojiArt.emojis[index].x += Int(offset.width)
            emojiArt.emojis[index].y += Int(offset.height)
        }
    }
    
    
    func scaleEmoji(_ emoji: EmojiArt.Emoji, by scale: CGFloat){
        if let index = e mojiArt.emojis.firstIndex(matching: emoji){
            emojiArt.emojis[index].size = Int((CGFloat(emojiArt.emojis[index].size) * scale).rounded(.toNearestOrEven))
        }
    }
    
    func setBackgroundURL( _ url: URL?){
        emojiArt.backgroundURL = url?.imageURL
    }
}
