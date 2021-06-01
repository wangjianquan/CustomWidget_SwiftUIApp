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
    public static var groupTableViewColor: Color {
        Color(.sRGB, red: 233/255, green: 233/255, blue: 235/255, opacity: 1.0)
    }
}
