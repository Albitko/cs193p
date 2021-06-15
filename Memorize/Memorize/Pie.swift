//
//  Pie.swift
//  Memorize
//
//  Created by Alex on 15.06.2021.
//

import SwiftUI

struct Pie: Shape {
    
    var startAngle: Angle
    var endAngle: Angle
    var clockWise: Bool = false
    
    func path(in rect: CGRect) -> Path {
        let center = CGPoint(x: rect.midX, y: rect.midY)
        let radius = min(rect.width, rect.height) / 2
        let start = CGPoint(
            x: center.x + radius + cos(CGFloat(startAngle.radians)),
            y: center.y + radius + cos(CGFloat(startAngle.radians))
        )
        
        
        var p = Path()
        p.move(to: center)
        p.addLine(to: start)
        p.addArc(center: center,
                 radius: radius,
                 startAngle: startAngle,
                 endAngle: endAngle,
                 clockwise: clockWise)
        p.addLine(to: center)
        return p
    }
}
