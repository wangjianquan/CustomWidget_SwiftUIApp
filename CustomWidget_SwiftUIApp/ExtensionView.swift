//
//  ExtensionView.swift
//  CustomWidget_SwiftUIApp
//
//  Created by MacBook Pro on 2021/5/21.
//

import SwiftUI
import Combine
import UIKit

extension View {
    func getScreenWidth() -> CGFloat {
        return UIScreen.main.bounds.width
    }
    func getScreenHeight() -> CGFloat {
        return UIScreen.main.bounds.height
    }
}


extension VerticalAlignment {
    struct CustomAlignment: AlignmentID {
        static func defaultValue(in context: ViewDimensions) -> CGFloat {
            return context[VerticalAlignment.center]
        }
    }
    static let customCenter = VerticalAlignment(CustomAlignment.self)
}

extension View {
    func alignAsBadge(withRatio ratio: CGFloat = 0.8,
                      alignment: Alignment = .topTrailing) -> some View {
        alignmentGuide(alignment.horizontal) {
            $0.width * ratio
        }
        .alignmentGuide(alignment.vertical) {
            $0[.bottom] - $0.height * ratio
        }
    }
}

extension View {
    
    func addVerifiedBadge(_ isVerified: Bool) -> some View {
        ZStack(alignment: .topTrailing) {
            self
            if isVerified {
                Image(systemName: "checkmark.circle.fill")
                    //1
//                    .offset(x: 3, y: -3)
                    /*2.
                     */
//                    .alignmentGuide(HorizontalAlignment.trailing) {
//                        $0[HorizontalAlignment.center]
//                    }
//                    .alignmentGuide(VerticalAlignment.top){
//                        $0[VerticalAlignment.center]
//                    }
                                
                    //3.
//                    .alignmentGuide(HorizontalAlignment.trailing, computeValue: { dimension in
//                        dimension.width * 0.8
//                    })
//                    .alignmentGuide(VerticalAlignment.top, computeValue: { dimension in
//                        dimension[.bottom] - dimension.height * 0.8
//                    })
                //4.
                    .alignAsBadge()
            }
        }
    }
}

private struct HeightPreferenceKey: PreferenceKey {
    static let defaultValue: CGFloat = 0
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}

extension View {
    func syncingHeightIfLarger(than height: Binding<CGFloat?>) -> some View {
        background(GeometryReader { proxy in
            Color.clear.preference(
                key: HeightPreferenceKey.self,
                value: proxy.size.height
            )
        })
        .onPreferenceChange(HeightPreferenceKey.self) {
            height.wrappedValue = max(height.wrappedValue ?? 0, $0)
        }
    }
}

extension Publishers {
    // 1.
    static var keyboardHeight: AnyPublisher<CGFloat, Never> {
        // 2.
        let willShow = NotificationCenter.default.publisher(for: UIApplication.keyboardWillShowNotification)
            .map { $0.keyboardHeight }

        let willHide = NotificationCenter.default.publisher(for: UIApplication.keyboardWillHideNotification)
            .map { _ in CGFloat(0) }

        // 3.
        return MergeMany(willShow, willHide).eraseToAnyPublisher()
    }
}

extension Notification {
    var keyboardHeight: CGFloat {
        return (userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect)?.height ?? 0
    }
}

extension Color {
    public static var groupTableViewColor = Color(.sRGB, red: 233/255, green: 233/255, blue: 235/255, opacity: 1.0)
}

//struct AnimatedBackgroundGradient: View {
//    let colors = [Color.blue, Color.purple, Color.pink, Color.pink, Color.red, Color.purple, Color.blue, Color.purple, Color.red, Color.purple, Color.pink, Color.pink]
//    @State private var start = UnitPoint(x: 0, y: -2)
//    @State private var end = UnitPoint(x: 4, y: 0)
//    var body: some View {
//        LinearGradient(gradient: Gradient(colors: colors), startPoint: start, endPoint: end)
//            .animation(Animation.easeInOut(duration: 3).repeatForever())
//            .onAppear {
//                self.start = UnitPoint(x: 4, y: 0)
//                self.end = UnitPoint(x: 0, y: 2)
//                self.start = UnitPoint(x: -4, y: 20)
//                self.end = UnitPoint(x: 4, y: 0)
//            }
//    }
//}

/*
 **使SwiftUI 布局组（如 Group、VStack、HStack、List、ForEach 等）中启用 10 个以上的子视图。
 **
 */
extension ViewBuilder {
    
    /// `ViewBuilder` extension to build TupleView with 15 child view (using `Group` as well).
        public static func buildBlock<C0, C1, C2, C3, C4, C5, C6, C7, C8, C9, C10, C11, C12, C13, C14>
        // Parameters.
            (_ c0: C0, _ c1: C1, _ c2: C2, _ c3: C3, _ c4: C4, _ c5: C5, _ c6: C6, _ c7: C7, _ c8: C8, _ c9: C9, _ c10: C10, _ c11: C11, _ c12: C12, _ c13: C13, _ c14: C14)
        // Return type.
            -> TupleView<
                (
                    Group<TupleView<(C0, C1, C2, C3, C4, C5, C6, C7, C8, C9)>>,
                    Group<TupleView<(C10, C11, C12, C13, C14)>>
                )
            >
        // Type constraints.
            where C0: View, C1: View, C2: View, C3: View, C4: View, C5: View, C6: View, C7: View, C8: View, C9: View, C10: View, C11: View, C12: View, C13: View, C14: View
        // Function body.
        {
            TupleView(
                (
                    Group { TupleView((c0, c1, c2, c3, c4, c5, c6, c7, c8, c9)) },
                    Group { TupleView((c10, c11, c12, c13, c14)) }
                )
            )
        }
}
