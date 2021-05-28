//
//  WJTextHUD.swift
//  CustomWidget_SwiftUIApp
//
//  Created by MacBook Pro on 2021/5/28.
//

import SwiftUI

struct WJTextHUD: View {
    var textString: String? = nil

//    @Binding var isLoading: Bool
//   var show: Bool
//    @State var show: Bool
    @Binding var show: Bool

    var body: some View {
        ZStack(content: {
            BlurView()
            HStack(content: {
                Text(textString ?? "成功")
                    .foregroundColor(.white)
//                    .fontWeight(.bold)
//                    .padding(.top, 8)
            })
           
        })
        .animation(.spring(response: 0.5, dampingFraction: 0.5))
        .transition(.moveTopScale)
        .frame(width: 110, height: 44)
//        .background(Color.gray.opacity(1))
        .cornerRadius(5)
        .onAppear(perform: {
            DispatchQueue.global(qos: .default).async {
                sleep(UInt32(2.5))
                DispatchQueue.main.async {
                    show = false
                }
            }
        })
    }
}


