//
//  ToggleStyle_TestView.swift
//  CustomWidget_SwiftUIApp
//
//  Created by MacBook Pro on 2021/6/1.
//

import SwiftUI

struct ToggleStyle_TestView: View {
    @State var active1 = false
    @State var active2 = false
    @State var active3 = false
    var body: some View {
        VStack(content: {
            Toggle(isOn: $active1, label: {
                Text("CheckmarkToggleStyle")
            })
            .toggleStyle(CheckmarkToggleStyle())
            
            Toggle(isOn: $active2, label: {
                Text("PowerToggleStyle")
            }).toggleStyle(PowerToggleStyle())
            
            Toggle(isOn: $active3, label: {
                Text("ImageToggleStyle")
            }).toggleStyle(ImageToggleStyle(onImageName: "h1", offImageName: "h2"))
        })
    }
}

struct ToggleStyle_TestView_Previews: PreviewProvider {
    static var previews: some View {
        ToggleStyle_TestView()
    }
}
