//
//  AppGuideView.swift
//  AnimatedIndicator
//
//  Created by MacBook Pro on 2021/5/21.
//

import SwiftUI

//  新手引导
struct AppGuideView:View {
    var images: [String] = ["FirstLaunch_1","FirstLaunch_2","FirstLaunch_3","FirstLaunch_4","FirstLaunch_5"]
    
    @State var offset: CGFloat = 0
    
    var body: some View {
        
            ScrollView(.init()){
                TabView {
                    ForEach(0 ..< images.count) { index in

                        if index == 0{
                            
                            Image(images[index])
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                
                                .overlay(
                                    GeometryReader(content: { geometry ->Color in
                                        let minX = geometry.frame(in: .global).minX
                                        DispatchQueue.main.async {
                                            withAnimation(.default) {
                                                self.offset = -minX
                                            }
                                        }
                                        return Color.clear
                                    }).frame(width: 0, height: 0)
                                    , alignment: .leading)
                        }else{
                            Image(images[index])
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                            
                        }
                        
                    }
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                
                .overlay(
                    HStack(spacing: 15, content: {
                        ForEach(0 ..< images.count) { index in
                            Capsule()
                                .fill(Color.pink)
                                .frame(width: getIndex() == index ? 20 : 7, height: 7)
                        }
                        
                    })
                    .overlay(
                        Capsule()
                            .fill(Color.pink)
                            .frame(width: 20, height: 7)
                            .offset(x: getOffset()) , alignment: .leading
                    )
                    .padding(.bottom, UIApplication.shared.windows.first?.safeAreaInsets.bottom)
                    .padding(.bottom,10), alignment: .bottom
                )
            }
            .ignoresSafeArea()
    }
    
    fileprivate func getIndex() -> Int {
        let index = Int(round(Double(offset / getScreenWidth())))
        return index
    }
    
    fileprivate func getOffset() -> CGFloat {
        let progress = offset / getScreenWidth()
        return 22 * progress
        
    }
}

