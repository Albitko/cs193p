//
//  OptionalImage.swift
//  EmojiArt
//
//  Created by Alex on 31.07.2021.
//

import SwiftUI

struct OptionalImage: View{
    var uiImage: UIImage?
    
    var  body: some View{
        Group {
            if uiImage != nil {
        Image(uiImage: uiImage!)
            }
        }
    }
}
