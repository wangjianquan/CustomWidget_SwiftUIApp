//
//  UpdatedVersionView.swift
//  CustomWidget_SwiftUI
//
//  Created by MacBook Pro on 2021/1/15.
//  

import SwiftUI

struct UpdatedVersionView: View {
    
    @Binding var show : Bool
    var version : String
    var content : String
    
    var body: some View {
        GeometryReader(content: { geometry in
            ZStack(alignment: Alignment(horizontal: .trailing, vertical: .top)) {
                
                VStack(spacing: 24) {
                    Image("VersionUpdate_Icon")
                    Text(version)
                        .font(.title2)
                    Text(content)
                    Button {
                        withAnimation {
                            openAppStore()
                        }
                    } label: {
                        Text("立即更新")
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding(.vertical,10)
                            .padding(.horizontal,25)
                            .background(Color.purple)
                            .clipShape(Capsule())
                    }
                }
                .frame(width: (UIDevice.current.userInterfaceIdiom == .pad ? 375 : (geometry.size.width-60)))
                .padding(.vertical,25)
                .background(HUDBlurView())
                .background(Color.white)
                Button {
                    withAnimation {
                        show.toggle()
                    }
                } label: {
                    Image(systemName: "xmark.circle")
                        .font(.system(size: 28, weight: .bold))
                        .foregroundColor(.purple)
                }
                .padding()

            }
            .cornerRadius(24)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(
                Color.primary.opacity(0.35)
                    .onTapGesture {
                        withAnimation {
                            //点击背景消失
                            //show.toggle()
                        }
            })
        })
    }
    
    fileprivate func openAppStore() {
        let url = URL(string: "https://apps.apple.com/cn/app/%E6%8A%96%E9%9F%B3/id1142110895")
        if let URL = url , UIApplication.shared.canOpenURL(URL) == true {
            if #available(iOS 10.0, *) {
                UIApplication.shared.open(URL, options: [:], completionHandler: nil)
            } else {
                _ = UIApplication.shared.openURL(URL)
            }
        }
     }
}
 
