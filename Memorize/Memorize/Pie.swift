//
//  Pie.swift
//  Memorize
//
//  Created by Alex on 15.06.2021.
//

import SwiftUI

struct Pie: Shape {
    /*
    let startAngle: Angle
    let endAngle: Angle
    func path(in rect: CGRect) -> Path {
        let center = CGPoint.init(x: (rect.origin.x + rect.width)/2, y: (rect.origin.y + rect.height)/2)
        let radii = min(center.x, center.y)
        let path = Path { p in
            p.addArc(center: center,
                     radius: radii,
                     startAngle: startAngle,
                     endAngle: endAngle,
                     clockwise: true)
            p.addLine(to: center)
        }
        return path
   }
     */
    var startAngle: Angle
    var endAngle: Angle
    var clockWise: Bool = true
    
    func path(in rect: CGRect) -> Path {
        let center = CGPoint(x: rect.midX, y: rect.midY)
        let radius = min(center.x, center.y)
        
        var p = Path()
        p.move(to: center)
        //p.addRelativeArc(center: center, radius: radius, startAngle: startAngle, delta: endAngle)
        p.addArc(center: center,radius: radius,startAngle: startAngle,endAngle: endAngle,clockwise:clockWise)
        p.addLine(to: center)
        return p
    }
    
}
