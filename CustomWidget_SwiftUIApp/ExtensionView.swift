//
//  ExtensionView.swift
//  CustomWidget_SwiftUIApp
//
//  Created by MacBook Pro on 2021/5/21.
//

import SwiftUI

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
