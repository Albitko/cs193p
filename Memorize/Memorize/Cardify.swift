//
//  Cardify.swift
//  Memorize
//
//  Created by Alex on 16.06.2021.
//

import SwiftUI

struct Cardify: AnimatableModifier {
    
    var rotation: Double
    
    init (isFaceUp:Bool){
        rotation = isFaceUp ? 0 : 180;
    }
    
    var isFaceUp: Bool {
        rotation < 90
    }
    
    var animatableData: Double{
        get {return rotation}
        set {rotation = newValue}
    }
    

    
    private let rectCornerRadius: CGFloat = 10.0
    private let edgeLineWidth: CGFloat = 3
    
    func body(content: Content) -> some View{
        let shape = RoundedRectangle(cornerRadius:rectCornerRadius)
        
        return ZStack{
            Group{
                shape.fill(Color.white)
                shape.stroke(lineWidth: edgeLineWidth)
                content
            }
                .opacity(isFaceUp ? 1 : 0)
            shape.fill()
                .opacity(isFaceUp ? 0 : 1)
            
        }
        .rotation3DEffect(
            Angle.degrees(rotation),
            axis: (x: 0.0, y: 1.0, z: 0.0)
        )
    }
}

extension View {
    func cardify(isFaceUp: Bool) -> some View{
        self.modifier(Cardify(isFaceUp: isFaceUp))
    }
}

    
