//
//  PublishView.swift
//  CustomTabBar
//
//  Created by MacBook Pro on 2020/11/12.
//

import SwiftUI

struct ShadowStyleModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: 10)
            .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: -10)
    }
}

extension Color {
    static let offWhite = Color(red: 225 / 255, green: 225 / 255, blue: 235 / 255)
}

struct wjgContentView: View {
    var body: some View {
        ZStack {
            Color.offWhite
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct Shadow: View {
    var body: some View{
        HStack(alignment: .center, spacing: 15, content: {
            Image("cm2_guide_duoduo")
//                .resizable()
                .frame(width:66,height: 66)
            
            VStack(alignment: .leading, spacing: 15, content: {
                Text("陕西省人民医院")
                    .font(.title2)
                Text("陕西省西安市碑林区黄雁村友谊西路256号")
                    .font(.system(size: 15))
                    .foregroundColor(.secondary)
            })
            .padding(EdgeInsets(top: 12, leading: 0, bottom: 12, trailing: 12))
        })
        .frame(minWidth: 0.0, maxWidth:UIScreen.main.bounds.size.width-30)
        .background(Color.white)
    }
}

struct PublishView: View {
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack(alignment: .center, spacing: nil, content: {
            
            Text("信息发布")
                .font(.headline)
            Divider()
           
            Spacer().frame(height: 20)

            ZStack(alignment: Alignment(horizontal: .center, vertical: .center), content: {
                RoundedRectangle(cornerRadius: 5)
                    .fill(Color.offWhite)
                    .frame(maxWidth: UIScreen.main.bounds.width-20, minHeight: 88, maxHeight: 100)
                    .shadow(color: Color.black.opacity(0.1), radius: 10, x: 10, y: 10)
                    .shadow(color: Color.black.opacity(0.1), radius: 10, x: -5, y: -5)
            })
            
            Spacer().frame(height: 50)
            Shadow()
                .background(Color.white)
                .cornerRadius(8)

                .clipShape(ContainerRelativeShape())
                .modifier(ShadowStyleModifier())

            
            Spacer()
            HStack(alignment:.center,spacing: 5, content: {
                Button(action: {
                    presentationMode.wrappedValue.dismiss()

                }, label: {
                    Image(systemName: "multiply.circle.fill")
                        .resizable()
                        .frame(width: 30, height: 30)
                })
            
                .frame(maxWidth: 44, maxHeight: 44)
            })
        })
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.white)
        .padding()
        .onTapGesture {
            presentationMode.wrappedValue.dismiss()
        }
        
    }
}

struct PublishView_Previews: PreviewProvider {
    static var previews: some View {
        PublishView()
    }
}
