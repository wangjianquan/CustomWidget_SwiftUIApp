//
//  LoadingView.swift
//  CustomWidget_SwiftUI
//
//  Created by MacBook Pro on 2021/1/14.
//

import SwiftUI

struct LoadingView: View {
    @Binding var isLoading: Bool
    var loadStr: String? = nil
    
    var body: some View {
        ZStack(content: {
            BlurView()
            VStack(content: {
                IndicatorView(isLoading: $isLoading)
                Text(loadStr ?? "加载中...")
                    .foregroundColor(.white)
                    .padding(.top, 8)
            })
        })
        .frame(width: 110, height: 110)
        .cornerRadius(5)
    }
}

struct BlurView: UIViewRepresentable {
    
    func makeUIView(context: Context) -> UIVisualEffectView {
        let effect = UIBlurEffect(style: .systemMaterialDark)
        let visualView = UIVisualEffectView(effect: effect)
        return visualView
    }
    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {
        
    }
}

struct IndicatorView: UIViewRepresentable {
    @Binding var isLoading: Bool
    
    func makeUIView(context: UIViewRepresentableContext<IndicatorView>) -> UIActivityIndicatorView {
        let activity = UIActivityIndicatorView(style: .large)
        activity.color = .white

        return activity
    }
    func updateUIView(_ uiView: UIActivityIndicatorView, context: UIViewRepresentableContext<IndicatorView>) {
        isLoading ? uiView.startAnimating() : uiView.stopAnimating()
    }
}
