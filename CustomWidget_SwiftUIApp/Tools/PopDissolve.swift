//
//  PopDissolve.swift
//  CustomWidget_SwiftUIApp
//
//  Created by MacBook Pro on 2021/5/28.
//

import SwiftUI

struct PopDissolve<T: View>: ViewModifier {
    let popup: T
    let alignment: Alignment
    let isPresented: Bool

    init(isPresented: Bool, alignment: Alignment, @ViewBuilder content: () -> T) {
        self.isPresented = isPresented
        self.alignment = alignment
        popup = content()
    }

    func body(content: Content) -> some View {
        content
            .overlay(popupContent())
    }

    /*
     与Popup指定了弹出方向不同的是 PopDissolve不对content视图做动画及transition操作，具体操作在对应content内部实现
     */
    @ViewBuilder
    private func popupContent() -> some View {
        GeometryReader { geometry in
            
            if isPresented {
                popup
                    .frame(width: geometry.size.width, height: geometry.size.height, alignment: alignment)
            }
        }
    }
}

extension View {
    func popDissolve<T: View>(
        isPresented: Bool,
        alignment: Alignment = .center,
        @ViewBuilder content: () -> T
    ) -> some View {
        return modifier(PopDissolve(isPresented: isPresented, alignment: alignment, content: content))
    }
}

