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
    Banner(id: 1, img: "h1", name: "name1", show: false),
    Banner(id: 2, img: "h2", name: "name2", show: false),
    Banner(id: 3, img: "h3", name: "name3", show: false),
    Banner(id: 4, img: "h4", name: "name4", show: false),
]
struct ContentView: View {
    
    @State var isShow = false
    @State var HUD = false
    @State var password = ""
    @State var updateVervison = false
    @State private var avator: Image?
    @State private var inputImage: UIImage?
    
    @State var showingImagePicker = false

    var body: some View {
        ZStack (alignment: Alignment(horizontal: .center, vertical: .center)) {

            VStack(spacing: 25,content: {

                HStack(spacing: 15) {
                    ForEach(dataSource) { i in
                        BannerView(data: i)
                            .frame(width: UIScreen.main.bounds.width-30, height: 240)
                    }
                }.background(Color.green)
                
//                Button(action: {
//                    withAnimation { self.showingImagePicker = true }
//                }, label: {
//                    if avator != nil {
//                        avator?.resizable().scaledToFit()
//                    }else{
//                        Image("default").resizable().scaledToFit()
//                    }
//                }).sheet(isPresented: $showingImagePicker, onDismiss: loadImage, content: {
//                    ImagePicker(image: self.$inputImage)
//                }).frame(width: 88,height: 88)
////
//                Button(action: {
//                    self.isShow = true
//                    DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
//                        self.isShow = false
//                    }
//                }, label: {
//                    Text("Button")
//                }).blur(radius: self.isShow ? 3 : 0,opaque: true)
//                if isShow {
//                    LoadingView(isLoading: $isShow, loadStr: "loading ...")
//                }
////
//                Button(action: {
//                    alertView()
//                }, label: {
//                    Text("alert")
//                })
//                Text(password).fontWeight(.bold)
//
//                Button(action: {
//                    withAnimation {
//                        self.HUD.toggle()
//                    }
//                }, label: {
//                    Text("HUD progress View")
//                })
//
//                Button(action: {
//                    withAnimation {
//                        self.updateVervison.toggle()
//                    }
//                }, label: {
//                    Text("CustomAlertView")
//                })
            })
            if HUD {
                HUDProgressView(placeHolder: "place wait", show: $HUD)
            }

            if updateVervison {

                UpdatedVersionView(show: $updateVervison, version: "新版本 v1.2.0", content: "1.性能优化\n2.第三方库升级\n3.优化设计")

            }
        }
        .background(Color.black.opacity(0.7))
        .edgesIgnoringSafeArea(.all)
    }
    
    func alertView() {
        let alert = UIAlertController(title: "login", message: "enter your passsword", preferredStyle: .alert)
        alert.addTextField { (textField) in
            textField.isSecureTextEntry = true
            textField.placeholder = "password"
        }
        
        let login = UIAlertAction(title: "login", style: .default) { (_) in
            password = alert.textFields?.first?.text ?? ""
        }
        let cancel = UIAlertAction(title: "cancel", style: .destructive) { (_) in
            
        }
        alert.addAction(login)
        alert.addAction(cancel)
        UIApplication.shared.windows.first?.rootViewController?.present(alert, animated: true, completion: nil)
    }
    
    func loadImage() {
        guard let inputImage = inputImage else { return }
        avator = Image(uiImage: inputImage)
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
