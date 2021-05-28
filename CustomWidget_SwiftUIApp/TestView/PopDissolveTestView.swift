//
//  PopDissolveTestView.swift
//  CustomWidget_SwiftUIApp
//
//  Created by MacBook Pro on 2021/5/28.
//

import SwiftUI

struct PopDissolveTestView: View {
    
   
    @State var isTop = false
    @State var isTopTop = false
    @State var isBottomTop = false
    @State var isBottomBottom = false

    @State var isCenterBottom = false
    @State var isCenterTop = false
    @State var isCenterCenter = false

    @State var isPresented = false
    @State var isLoading = false
    @State var isShow = false

    var body: some View {
        VStack(alignment: .center, spacing: 10, content: {
            Toggle("isTop", isOn: $isTop).background(Color.white)
            Toggle("isTopTop", isOn: $isTopTop).background(Color.white)
            Toggle("isBottomTop", isOn: $isBottomTop).background(Color.white)
            Toggle("isBottomBottom", isOn: $isBottomBottom).background(Color.white)
            Toggle("isCenterBottom", isOn: $isCenterBottom).background(Color.white)
            Toggle("isCenterTop", isOn: $isLoading).background(Color.white)
            
            Button(action: {
                self.isCenterCenter = true
            }, label: {
                Text("isCenterCenter").padding()
            }).background(Color.white)

            Button("isPresented", action: { isPresented.toggle() }).background(Color.white)
            Button("isLoading", action: { isShow.toggle() }).background(Color.white)
            Button(action: {
                self.isLoading = true
//                DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
//                    self.isLoading = false
//                }
            }, label: {
                Text("WJTextHUD").background(Color.white)
            })
//            .blur(radius: self.isLoading ? 3 : 0,opaque: true)
            
        })
            .frame(width: .infinity, height: .infinity)
        
        .background(Color.pink)
        .navigationBarTitle("PopDissolveTest", displayMode: .inline)
        .navigationBarItems(
            trailing:
                NavigationLink(destination: ContentView()) {
                    Image(systemName: "bookmark.circle.fill").resizable().frame(width: 35, height: 35)
                }
        )
        .popDissolve(isPresented: isPresented, content: {
            HUDProgressView(placeHolder: "place wait", show: $isPresented)
        })
        .popDissolve(isPresented: isShow,  content: {
            UpdatedVersionView(show: $isShow, version: "新版本 v1.2.0", content: "1.性能优化\n2.第三方库升级\n3.优化设计")
        })
        
        .popDissolve(isPresented: isLoading, content: {
            TextHUD(show: $isLoading)
//                .transition(.moveTopScale)
//                .animation(.default)
//

//            Color.blue.frame(width: 100, height: 100)

        })
        .edgesIgnoringSafeArea(.all)

        
    }
    
    
}

struct PopDissolveTestView_Previews: PreviewProvider {
    static var previews: some View {
        PopDissolveTestView()
    }
}


//struct TextHUD: View {
//    var textString: String? = nil
//
////    @Binding var isLoading: Bool
////   var show: Bool
////    @State var show: Bool
//    @Binding var show: Bool
//
//    var body: some View {
//        Text(textString ?? "成功ddd")
//            .foregroundColor(.white)
////                    .fontWeight(.bold)
////                    .padding(.top, 8)
////        .animation(.spring(response: 0.5, dampingFraction: 0.5))
//        .frame(width: 110, height: 44)
//        .background(Color.black.opacity(0.5))
//        .cornerRadius(5)
//        .onAppear(perform: {
//            withAnimation(Animation.spring(response: 0.5, dampingFraction: 0.1)) {
//                DispatchQueue.global(qos: .default).async {
//                    sleep(UInt32(2.5))
//                    DispatchQueue.main.async {
////                        show = false
//                    }
//                }
//            }
////            withAnimation(Animation.spring(response: 0.5, dampingFraction: 0.5, blendDuration: 1).repeatForever()) {
////                DispatchQueue.global(qos: .default).async {
////                    sleep(UInt32(2.5))
////                    DispatchQueue.main.async {
////                        show = false
////                    }
////                }
////            }
//        })
//    }
//}


struct TextHUD: View {
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
//                    .animation(.spring(response: 0.5, dampingFraction: 0.5))
//                    .transition(.moveTopScale)
           
        })
        .frame(width: 110, height: 44)
//        .background(Color.gray.opacity(1))
        .cornerRadius(5)
        .onAppear(perform: {
//            Animation.spring(response: 0.5, dampingFraction: 0.1)
            withAnimation(Animation.easeInOut(duration: 3).delay(1)) {
                DispatchQueue.global(qos: .default).async {
                    sleep(UInt32(2.5))
                    DispatchQueue.main.async {
//                        show = false
                    }
                }
            }
//            withAnimation(Animation.spring(response: 0.5, dampingFraction: 0.5, blendDuration: 1).repeatForever()) {
//                DispatchQueue.global(qos: .default).async {
//                    sleep(UInt32(2.5))
//                    DispatchQueue.main.async {
//                        show = false
//                    }
//                }
//            }
        })
    }
}
