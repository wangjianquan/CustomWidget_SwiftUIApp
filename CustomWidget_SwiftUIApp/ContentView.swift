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
    @State var password = ""
    @State var updateVervison = false
    @State private var avator: Image?
    @State private var inputImage: UIImage?
    
    @State var showingImagePicker = false

    var body: some View {
        ZStack  {

            VStack(spacing: 25,content: {
                Spacer(minLength: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/)
                BannerView(dataSource: dataSource)

                Button(action: {
                    withAnimation { self.showingImagePicker = true }
                }, label: {
                    if avator != nil {
                        avator?.resizable().scaledToFit()
                    }else{
                        Image("default").resizable().scaledToFit()
                    }
                }).sheet(isPresented: $showingImagePicker, onDismiss: loadImage, content: {
                    ImagePicker(image: self.$inputImage)
                }).frame(width: 88,height: 88)
////
                Button(action: {
                    self.isShow = true
                    DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                        self.isShow = false
                    }
                }, label: {
                    Text("Button")
                }).blur(radius: self.isShow ? 3 : 0,opaque: true)
                if isShow {
                    LoadingView(isLoading: $isShow, loadStr: "loading ...")
                }
//
                Button(action: {
                    alertView()
                }, label: {
                    Text("alert")
                })
                Text(password).fontWeight(.bold)

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
            .frame(maxWidth: 320)
            .padding()
            .background(Color.pink.clipShape(BillShape()).cornerRadius(25))
            .padding(.horizontal)

            if HUD {
                HUDProgressView(placeHolder: "place wait", show: $HUD)
            }

            if updateVervison {

                UpdatedVersionView(show: $updateVervison, version: "新版本 v1.2.0", content: "1.性能优化\n2.第三方库升级\n3.优化设计")

            }
        }
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
struct BillShape: Shape {
    
    func path(in rect: CGRect) -> Path {
        return Path { path in
            
            path.move(to: CGPoint(x: 0, y: 0))
            path.addLine(to: CGPoint(x: 0, y: rect.height))
            path.addLine(to: CGPoint(x: rect.width, y: rect.height))
            path.addLine(to: CGPoint(x: rect.width, y: 0))
            
            path.move(to: CGPoint(x: 0, y: 80))
            path.addArc(center: CGPoint(x: 0, y: 80), radius: 20, startAngle: Angle(degrees: -90), endAngle: Angle(degrees: 90), clockwise: false)
            
            path.move(to: CGPoint(x: rect.width, y: 80))
            path.addArc(center: CGPoint(x: rect.width, y: 80), radius: 20, startAngle: Angle(degrees: 90), endAngle: Angle(degrees: -90), clockwise: false)
        }
    }
}
