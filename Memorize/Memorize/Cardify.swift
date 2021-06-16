//
//  Cardify.swift
//  Memorize
//
//  Created by Alex on 16.06.2021.
//

import SwiftUI

struct Cardify: ViewModifier {
    var isFaceUp: Bool
    
    private let rectCornerRadius: CGFloat = 10.0
    private let edgeLineWidth: CGFloat = 3
    
    func body(content: Content) -> some View{
        let shape = RoundedRectangle(cornerRadius:rectCornerRadius)
        
        return ZStack{
            if isFaceUp{
                shape.fill(Color.white)
                shape.stroke(lineWidth: edgeLineWidth)
                content
            }else{
                shape.fill()
            }
        }
    }
}

extension View {
    func cardify(isFaceUp: Bool) -> some View{
        self.modifier(Cardify(isFaceUp: isFaceUp))
    }
}

    
