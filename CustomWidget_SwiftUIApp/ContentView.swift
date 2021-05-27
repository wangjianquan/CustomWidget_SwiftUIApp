//
//  ContentView.swift
//  CustomWidget_SwiftUIApp
//
//  Created by MacBook Pro on 2021/1/22.
//

import SwiftUI
protocol ContainerView: View {
    associatedtype Content
    init(content: @escaping () -> Content)
}

extension ContainerView {
    init(@ViewBuilder _ content: @escaping () -> Content) {
        self.init(content: content)
    }
}

struct Carousel<Content:View> : ContainerView{
    var content: () -> Content
    
    var body: some View {
        ScrollView(.horizontal) {
            HStack(content: content).padding()
        }
    }
}
var dataSource = [
    Banner(id: 1, img: "h1", name: "name1", show: true),
    Banner(id: 2, img: "h2", name: "name2", show: true),
    Banner(id: 3, img: "h3", name: "name3", show: true),
    Banner(id: 4, img: "h4", name: "name4", show: true),
    Banner(id: 5, img: "h4", name: "name5", show: true)

//        Banner(id: 1, img: "FirstLaunch_1", name: "name1", show: false),
//        Banner(id: 2, img: "FirstLaunch_2", name: "name2", show: false),
//        Banner(id: 3, img: "FirstLaunch_3", name: "name3", show: false),
//        Banner(id: 4, img: "FirstLaunch_4", name: "name4", show: false),
//        Banner(id: 5, img: "FirstLaunch_5", name: "name5", show: false),
]
struct ContentView: View {
    
    @State var isShow = false
    @State var HUD = false
    @State private var value = 0
    @State private var showingSheet = false
    @State var password = ""
    @State var updateVervison = false
    
    
    @State var showingImagePicker = false

    var body: some View {
        ZStack  {
            VStack(spacing: 25,content: {
               
                Button(action: {
                    withAnimation {
                        self.HUD.toggle()
                    }
                }, label: {
                    Text("HUD progress View")
                })

                Button(action: {
                    withAnimation {
                        self.updateVervison.toggle()
                    }
                }, label: {
                    Text("CustomAlertView")
                })
            })
            .frame(maxWidth: getScreenWidth()-30)
            .frame(maxHeight: 320)

//            .padding()
            .background(Color.pink.cornerRadius(25))
//            .padding()

            if HUD {
                HUDProgressView(placeHolder: "place wait", show: $HUD)
            }

            if updateVervison {

                UpdatedVersionView(show: $updateVervison, version: "新版本 v1.2.0", content: "1.性能优化\n2.第三方库升级\n3.优化设计")

            }
        }
        .frame(width: getScreenWidth(), height: getScreenHeight())
        .background(Color.green)
        .edgesIgnoringSafeArea(.all)
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

