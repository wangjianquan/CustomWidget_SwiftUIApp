//
//  StickyHeader.swift
//  CustomWidget_SwiftUIApp
//
//  Created by MacBook Pro on 2021/6/1.
//

import SwiftUI

struct StickyHeader<Content: View>: View {
    var minHeight: CGFloat
    var content: Content
    
    init(minHeight: CGFloat = 200, @ViewBuilder content: () -> Content) {
        self.minHeight = minHeight
        self.content = content()
    }
    
    var body: some View {
        GeometryReader(content: { geometry in
            if(geometry.frame(in: .global).minY <= 0) {
                content
                    .frame(width: geometry.size.width, height: geometry.size.height, alignment: .center)
            } else {
                content
                    .offset(y: -geometry.frame(in: .global).minY)
                    .frame(width: geometry.size.width, height: geometry.size.height + geometry.frame(in: .global).minY)
            }
        }).frame(minHeight:minHeight)
    }
}


