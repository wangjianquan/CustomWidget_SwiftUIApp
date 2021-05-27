//
//  KeyboardTestView.swift
//  CustomWidget_SwiftUIApp
//
//  Created by MacBook Pro on 2021/5/25.
//

import SwiftUI
import Combine

struct KeyboardTestView: View {
    @State private var text = ""
    @State private var keyboardHeight: CGFloat = 0

    var body: some View {
        VStack {
            Spacer()
            
            TextField("Enter something", text: $text)
                .textFieldStyle(RoundedBorderTextFieldStyle())
        }
        .padding()
//                // 2.
//        .padding(.bottom, keyboardHeight)
//                // 3.
//        .onReceive(Publishers.keyboardHeight) { self.keyboardHeight = $0 }
    }
}

struct KeyboardTestView_Previews: PreviewProvider {
    static var previews: some View {
        KeyboardTestView()
    }
}
