//
//  Popup.swift
//  Popup(SwiftUI)
//
//  Created by MacBook Pro on 2021/5/25.
//

import SwiftUI

struct Popup<T: View>: ViewModifier {
    let popup: T
    let alignment: Alignment
    let direction: Direction
    let isPresented: Bool

    init(isPresented: Bool, alignment: Alignment, direction: Direction, @ViewBuilder content: () -> T) {
        self.isPresented = isPresented
        self.alignment = alignment
        self.direction = direction
        popup = content()
    }

    func body(content: Content) -> some View {
        content
            .overlay(popupContent())
    }

    @ViewBuilder
    private func popupContent() -> some View {
        GeometryReader { geometry in
            let normal_center: Bool = (direction == Direction.top ||  direction == Direction.bottom) ? true : false
            
            if isPresented {
                popup
//                    .animation(.spring())
                    .animation(.default)
//                    .transition(.offset(x: 0, y: direction.offset(popupFrame: geometry.frame(in: .global))))
                    .transition((normal_center == false) ? .scale : .offset(x: 0, y: direction.offset(popupFrame: geometry.frame(in: .global))))
                    .frame(width: geometry.size.width, height: geometry.size.height, alignment: alignment)
            }
        }
    }
}
extension AnyTransition {
    static var moveAndScale: AnyTransition {
        AnyTransition.move(edge: .bottom).combined(with: .scale)
    }
    
    static var moveTopScale: AnyTransition {
        AnyTransition.move(edge: .top).combined(with: .scale)
    }
}
extension Popup {
    enum Direction {
        case top, bottom, center

        func offset(popupFrame: CGRect) -> CGFloat {
            switch self {
            case .top:
                let aboveScreenEdge = -popupFrame.maxY
                return aboveScreenEdge
            
            case .bottom:
                let belowScreenEdge = UIScreen.main.bounds.height - popupFrame.minY
                return belowScreenEdge
            
            case .center:
                return popupFrame.midY
            }
        }
    }
}

extension View {
    func popup<T: View>(
        isPresented: Bool,
        alignment: Alignment = .center,
        direction: Popup<T>.Direction = .bottom,
        @ViewBuilder content: () -> T
    ) -> some View {
        return modifier(Popup(isPresented: isPresented, alignment: alignment, direction: direction, content: content))
    }
}

//private extension View {
//    func onGlobalFrameChange(_ onChange: @escaping (CGRect) -> Void) -> some View {
//        background(GeometryReader { geometry in
//            Color.clear.preference(key: FramePreferenceKey.self, value: geometry.frame(in: .global))
//        })
//        .onPreferenceChange(FramePreferenceKey.self, perform: onChange)
//    }
//
//    func print(_ varargs: Any...) -> Self {
//        Swift.print(varargs)
//        return self
//    }
//}
//
//private struct FramePreferenceKey: PreferenceKey {
//    static let defaultValue = CGRect.zero
//    static func reduce(value: inout CGRect, nextValue: () -> CGRect) {
//        value = nextValue()
//    }
//}
//
//private extension View {
//    @ViewBuilder func applyIf<T: View>(_ condition: @autoclosure () -> Bool, apply: (Self) -> T) -> some View {
//        if condition() {
//            apply(self)
//        } else {
//            self
//        }
//    }
//}



//struct Popup_Previews: PreviewProvider {
//    static var previews: some View {
//        Color.clear
//            .modifier(Popup(isPresented: true,
//                            alignment: .topTrailing,
//                            direction: .bottom,
//                            content: { Color.orange.frame(width: 100, height: 100) }))
//
//            .modifier(Popup(isPresented: true,
//                            alignment: .center,
//                            direction: .top,
//                            content: { Color.yellow.frame(width: 100, height: 100) }))
//
//            .modifier(Popup(isPresented: true,
//                            alignment: .bottom,
//                            direction: .top,
//                            content: { Color.blue.frame(width: 100, height: 100) }))
//
//
//            .modifier(Popup(isPresented: true,
//                            alignment: .bottomTrailing,
//                            direction: .bottom,
//                            content: { Color.black.frame(width: 100, height: 100) }))
//            .previewDevice("iPod touch")
//
//    }
//}
