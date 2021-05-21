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
    @State private var avator: Image?
    @State private var inputImage: UIImage?
    
    @State var showingImagePicker = false

    var body: some View {
        NavigationView {

            VStack(spacing: 15, content: {
                NavigationLink(destination:BannerView(dataSource: dataSource)) {
                    Text("轮播图")
                }.buttonStyle(PlainButtonStyle())

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
//
                    Button(action: {
                        withAnimation {
                            self.HUD.toggle()
                        }
                    }, label: {
                        Text("HUD progress View")
                    })

                    if HUD {
                        HUDProgressView(placeHolder: "place wait", show: $HUD)
                    }

//                    Button(action: {
//                        withAnimation {
//                            self.updateVervison.toggle()
//                        }
//                    }, label: {
//                        Text("CustomAlertView")
//                    })
//
//                    if updateVervison {
//
//                        UpdatedVersionView(show: $updateVervison, version: "新版本 v1.2.0", content: "1.性能优化\n2.第三方库升级\n3.优化设计")
//
//                    }


                VStack(spacing:nil, content: {
                    Stepper("Change badgeValue", value: $value, in: 0...88).padding(10)
                    HStack(spacing: 24, content: {
                        BadgeImageView(icon: "message1",badgeValue: $value, action: $showingSheet)
                            .frame(width: 44, height: 44)
                           .actionSheet(isPresented: $showingSheet) { () -> ActionSheet in
                               ActionSheet(title: Text("ActionSheet"), message: Text("message"), buttons: [.cancel(Text("取消")),.default(Text("拍照"),action: {

                               }),.default(Text("相册"), action: {

                               })])}
//                        Spacer()
                        NavigationLink(destination: ShapeTestView()) {
                            BadgeButton(icon: "message",badgeValue: $value, action: $showingSheet)
                                .background(Color.blue)
                        }
                    })
                    Spacer()
                })
                .frame(maxWidth: 320 ,maxHeight: 150)
                .padding()
//                .padding(.horizontal)
                .background(Color.purple.clipShape(BillShape()).cornerRadius(25))
                
//
               
                

            })
            .background(Color.gray)




            .navigationBarTitle("个人中心", displayMode: .inline)
            .navigationBarItems(
                leading:
                    NavigationLink(destination: AppGuideView()) {
                        Image(systemName: "bookmark.circle.fill")
                            .resizable()
                            .frame(width: 35, height: 35)
                    }
                ,
                trailing:
                    NavigationLink(destination: SearchHistoryView()) {
                        BadgeButton(icon: "message1",badgeValue: $value, action: $showingSheet)
                    }
                    
                
            )
        }
//        .onAppear {
//        //viewDidAppear()
//            print("RespondEevent appeared!")
//        }.onDisappear {
//        //viewDidDisappear()
//            print("RespondEevent disappeared!")
//        }
        ZStack  {

            VStack(spacing: 25,content: {


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
        .frame(width: getScreenWidth(), height: getScreenHeight())
        .background(Color.green)
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

