//
//  HUDProgressView.swift
//  CustomWidget_SwiftUI
//
//  Created by MacBook Pro on 2021/1/14.
//

import SwiftUI

struct HUDProgressView: View {
    var placeHolder : String
    @Binding var show : Bool
    @State var animate = false
    
    var body: some View {
        ZStack(content: {
            VStack {
                Circle()
                    .stroke(AngularGradient(gradient: .init(colors: [Color.primary,Color.primary.opacity(0)]), center: .center))
                    .frame(width: 66, height: 66)
                    .rotationEffect(.init(degrees: animate ? 360 : 0))
                
                Text(placeHolder)
                    .fontWeight(.bold)
            }
            .padding(.vertical,25)
            .padding(.horizontal,35)
            .background(HUDBlurView())
            .cornerRadius(15)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(
                Color.primary.opacity(0.35)
                    .onTapGesture {
                        withAnimation {
                            show.toggle()
                        }
            })
        })
        .onAppear{
            withAnimation(Animation.linear(duration: 1.5).repeatForever(autoreverses: false)) {
                animate.toggle()
            }
        }
    }
}

struct HUDBlurView : UIViewRepresentable {
    
    func makeUIView(context: Context) -> some UIView {
        let view = UIVisualEffectView(effect: UIBlurEffect(style: .systemThinMaterial))
        return view
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
}
