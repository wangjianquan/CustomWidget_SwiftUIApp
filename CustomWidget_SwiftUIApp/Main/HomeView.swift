//
//  HomeView.swift
//  AppDemo_SwiftUI
//
//  Created by MacBook Pro on 2020/10/16.
//

import SwiftUI

struct HomeView: View {
    
    @State var isShow = false
    @State var HUD = false
    @State private var value = 0
    @State private var showingSheet = false
    @State var password = ""
    @State var updateVervison = false
    @State private var avator: Image?
    @State private var inputImage: UIImage?
    
    @State var showingImagePicker = false
    
    @State var complete: Bool = false
    @State var inProgress: Bool = false
    
    @State var filters: [String] = [
        "SwiftUI", "Programming", "iOS", "Mobile Development", "😎"
        ]
    
    var body: some View {
        NavigationView {
            
                
                VStack(spacing: 15, content: {
                    AsyncButton(isComplete: complete, action: {
                        inProgress = true
                        // Start Async Task (Download, Submit, etc)
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                            withAnimation {
                                complete = true
                            }
                        }
                    }) {
                        Text(complete || inProgress ? "" : "Submit")
                    }
//                Spacer()
//                BannerView(dataSource: dataSource)
                HStack(spacing: 15) {

                    NavigationLink(destination:BannerView(dataSource: dataSource)) {
                        Text("轮播图").background(Color.gray.opacity(0.4))
                    }.buttonStyle(PlainButtonStyle())
                    
                    NavigationLink(destination:PopupTestView()) {
                        Text("Popup 弹出方向").background(Color.gray.opacity(0.5))
                    }.buttonStyle(PlainButtonStyle())
                    
                    NavigationLink(destination:PopDissolveTestView()) {
                        Text("PopDissolve").background(Color.gray.opacity(0.5))
                    }.buttonStyle(PlainButtonStyle())
                    
////                    NavigationLink(destination:KeyboardTestView()) {
////                        Text("键盘高度").background(Color.gray.opacity(0.5))
////                    }.buttonStyle(PlainButtonStyle())
//                    NavigationLink(destination:ContentView()) {
//                        Text("ContentView").background(Color.gray.opacity(0.5))
//                    }.buttonStyle(PlainButtonStyle())
                    
                    
                }
                .background(Color.white)
                .padding()

                Section {

                    HStack(spacing: 20, content: {
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
                        }).frame(width: 88,height: 88).addVerifiedBadge(true)
                        
                        Button(action: {
                            self.isShow = true
                            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                                self.isShow = false
                            }
                        }, label: {
                            Text(".popup").background(Color.white)
                        })
                        Button(action: {
                            self.isShow = true
                            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                                self.isShow = false
                            }
                        }, label: {
                            Text(".popDissolve").background(Color.white)
                        })
                    })
                    
                    ScrollView (.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(filters, id: \.self) { filter in
                                SearchKeyword(name: filter, color: Color.white, type: .removable({
                                    withAnimation {
                                        self.filters.removeAll { $0 == filter }
                                    }
                                }))
                                .transition(.opacity)
                            }
                        }
                        .padding(.horizontal, 20)
                    }
                    
    //
                    HStack(content: {
                        VStack{
                            Button(action: {
                                alertView()
                            }, label: {
                                Text("alert")
                            })
                            Text(password).fontWeight(.bold)
                        }

                        Button("HUD progress View") {
                            withAnimation {
                                self.HUD.toggle()
                            }
                        }

                        Button("updateVervison") {
                            withAnimation {
                                self.updateVervison.toggle()
                            }
                        }
                    }).background(Color.white)
                }
                
               
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
//                .frame(width: 320 ,height: 150)
                .padding()
//                .padding(.horizontal)
                .background(Color.purple.clipShape(BillShape()).cornerRadius(25))
                Spacer()
            })
//            .frame(width: .infinity, height: .infinity)
            
            .background(Color.pink)
            .navigationBarTitle("首页", displayMode: .inline)
            .navigationBarItems(
                leading:
                    NavigationLink(destination: ContentView()) {
                        Image(systemName: "bookmark.circle.fill").resizable().frame(width: 35, height: 35)
                    }
                ,
                trailing:
                    NavigationLink(destination: SearchHistoryView()) {
                        BadgeButton(icon: "message1",badgeValue: $value, action: $showingSheet)
                    }
            )
        }
        .popDissolve(isPresented: HUD, content: {
            HUDProgressView(placeHolder: "place wait", show: $HUD)
        })
        .popDissolve(isPresented: updateVervison,  content: {
            UpdatedVersionView(show: $updateVervison, version: "新版本 v1.2.0", content: "1.性能优化\n2.第三方库升级\n3.优化设计")
        })
        .popDissolve(isPresented: isShow, content: {
            LoadingView(isLoading: $isShow)
        })
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

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
