//
//  ShapeTestView.swift
//  CustomWidget_SwiftUIApp
//
//  Created by MacBook Pro on 2021/4/21.
//

import SwiftUI

struct ShapeTestView: View {
    let rect = UIScreen.main.bounds
    
    var body: some View {
//        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        ZStack(content: {
            CShape()
                .fill(Color.blue)
        })
    }
}

struct ShapeTestView_Previews: PreviewProvider {
    static var previews: some View {
        ShapeTestView()
    }
}
struct CShape: Shape {
    func path(in rect: CGRect) -> Path {
        return Path { path in
            // starting from bottom
            path.move(to: CGPoint(x: rect.width, y: rect.height - 50))
            path.addLine(to: CGPoint(x: rect.width, y: 0))
            path.addLine(to: CGPoint(x: 0, y: 0))
            path.addLine(to: CGPoint(x: 0, y: rect.height - 50))

            // adding curve

            // total radius of curve = 80
            path.addArc(center: CGPoint(x: rect.width - 40, y: rect.height - 50), radius: 40, startAngle: .zero, endAngle: Angle(degrees: 180), clockwise: false)
            
           
            
//            path.addArc(center: CGPoint(x: 40, y: rect.height), radius: 40, startAngle: .zero, endAngle: Angle(degrees: -90), clockwise: false)

        }
    }
}
