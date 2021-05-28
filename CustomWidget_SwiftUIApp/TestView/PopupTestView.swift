//
//  PopupTestView.swift
//  CustomWidget_SwiftUIApp
//
//  Created by MacBook Pro on 2021/5/28.
//

import SwiftUI

struct PopupTestView: View {
    @State var isTopBottom = false
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
            Toggle("isTopBottom", isOn: $isTopBottom).background(Color.white)
            Toggle("isTopTop", isOn: $isTopTop).background(Color.white)
            Toggle("isBottomTop", isOn: $isBottomTop).background(Color.white)
            Toggle("isBottomBottom", isOn: $isBottomBottom).background(Color.white)
            Toggle("isCenterBottom", isOn: $isCenterBottom).background(Color.white)
            Toggle("isCenterTop", isOn: $isCenterTop).background(Color.white)
            
            Button(action: {
                self.isCenterCenter = true
            }, label: {
                Text("isCenterCenter").padding()
            }).background(Color.white)

            Button("isPresented", action: { isPresented.toggle() }).background(Color.white)
            Button("isLoading", action: { isLoading.toggle() }).background(Color.white)
            Button(action: {
                self.isShow = true
                DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                    self.isShow = false
                }
            }, label: {
                Text("asyncAfter")
            }).blur(radius: self.isShow ? 3 : 0,opaque: true).background(Color.white)
        })
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding()
        .background(Color.pink)
        ///1:
        .popup(isPresented: isTopBottom, alignment: .top, content: {
            Loader.init()
        })
        .popup(isPresented: isTopTop, alignment: .top, direction: .top, content: {
            WJProgressHUD(show: $isTopTop)
        })
        ///2:
        .popup(isPresented: isBottomTop, alignment: .bottom,direction: .top, content: {
            Snackbar()
        })
        .popup(isPresented: isBottomBottom, alignment: .bottom, content: {
                Color.blue.frame(width: 100, height: 100)
        })

        ///3:
        .popup(isPresented: isCenterBottom, direction: .bottom, content: {
            LoadingView(isLoading: $isCenterBottom)
        })
        .popup(isPresented: isCenterTop, direction: .top, content: {
            LoadingView(isLoading: $isCenterTop)
        })
        .popup(isPresented: isCenterCenter, direction: .center, content: {
            WJProgressHUD(show: $isCenterCenter)
        })
        
        ///4.
        .popup(isPresented: isPresented, alignment: .topLeading, direction: .top, content: {
            Color.blue.frame(width: 100, height: 100)
        })
        .popup(isPresented: isPresented, alignment: .topTrailing, direction: .top, content: {
            Color.blue.frame(width: 100, height: 100)
        })
        .popup(isPresented: isPresented, alignment: .bottomLeading, content: {
            Color.blue.frame(width: 100, height: 100)
        })
        .popup(isPresented: isPresented, alignment: .bottomTrailing, content: {
            Color.blue.frame(width: 100, height: 100)
        })

        //5.
        .popup(isPresented: self.isShow, content: {
            Loader()
        })
    }
}

struct PopupTestView_Previews: PreviewProvider {
    static var previews: some View {
        PopupTestView()
    }
}

struct Loader: View {
    var body: some View {
        Group {
            ProgressView("Loading…")
                .foregroundColor(.white)
                .progressViewStyle(CircularProgressViewStyle(tint: Color.white))
        }
        .padding()
        .background(Color.black.opacity(1))
        .cornerRadius(10)
    }
}

struct Snackbar: View {
    var body: some View {
        HStack() {
            Image(systemName: "person.fill")
                .resizable()
                .aspectRatio(contentMode: ContentMode.fill)
                .frame(width: 40, height: 40)
           
            VStack(alignment: .leading, spacing: 4) {
                Text("Archi")
                    .foregroundColor(.black)
                    .font(.headline)
                
                Text("Gotcha, let's meet at 9am")
                    .font(.body)
                    .foregroundColor(.black)
            }
        }
        .padding(15)
        .frame(maxWidth: .infinity, idealHeight: 100)
        .background(Color.black.opacity(0.1))
    }
}

struct WJProgressHUD: View {
//    @Binding var isLoading: Bool
//   var isLoading: Bool
//    @State var show: Bool
    var loadStr: String? = nil
    @Binding var show: Bool

    var body: some View {
        ZStack(content: {
            BlurView()
            HStack(content: {
                Text(loadStr ?? "成功")
                    .foregroundColor(.white)
//                    .fontWeight(.bold)
//                    .padding(.top, 8)
            })
           
        })
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
