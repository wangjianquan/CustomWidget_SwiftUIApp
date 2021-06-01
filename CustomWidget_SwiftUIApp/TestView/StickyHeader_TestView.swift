//
//  StickyHeader_TestView.swift
//  CustomWidget_SwiftUIApp
//
//  Created by MacBook Pro on 2021/6/1.
//

import SwiftUI

struct StickyHeader_TestView: View {
    var colors: [Color] = [.blue, .green, .red, .orange, .pink, .yellow, .purple, .primary]
   
    @State var selection: Int = 0
    
    var body: some View {
        ///1.
//        ScrollView(.vertical, showsIndicators: false) {
//            StickyHeader {
//                ZStack {
//                    Color(red: 35/255, green: 45/255, blue: 50/255)
//                    VStack {
//                        Text("Joshua Tree")
//                            .font(.title)
//                            .fontWeight(.bold)
//                            .foregroundColor(.white)
//                        Text("California")
//                            .font(.title2)
//                            .fontWeight(.semibold)
//                            .foregroundColor(.white)
//                    }
//                }
//            }
//        }
        
        ///2.
//        ScrollView(.vertical, showsIndicators: false) {
//            VStack(alignment: .center, spacing: nil, content: {
//                StickyHeader(minHeight: 240) {
//                    StickyHeader {
//                        Image("h2")
//                            .resizable()
//                            .aspectRatio(contentMode: .fill)
//                    }
//                }
//            })
//
//        }
        ///3.
//        VStack(content: {
//            HStack(alignment: .center, spacing: 30) {
//
//    //            .toggleStyle(MyToggleStyle())
//                ForEach(0..<colors.count) { i in
//                     colors[i]
//                         .frame(width: 250, height: 350, alignment: .center)
//                         .cornerRadius(15)
//
//                }
//            }.modifier(ScrollingHStackModifier(items: colors.count, itemWidth: 250, itemSpacing: 30))
//
//        })
        ZStack {
//            Color.gray.opacity(0.8)
            SideMenu(selected: $selection, options: ["NEWEST", "POPULAR", "SALE"])
        }
//        .edgesIgnoringSafeArea(.vertical)
    }
}

struct StickyHeader_TestView_Previews: PreviewProvider {
    static var previews: some View {
        StickyHeader_TestView()
    }
}

struct SideMenu: View {

    @Binding var selected: Int
    var options: [String]
    
    var body: some View {
        GeometryReader { geo in
            HStack {
                ForEach(options.indices) { i in
                    Button(action: {
                        withAnimation {
                            self.selected = i
                        }
                    }, label: {
                        Text(options[i])
                            .font(.body)
                            .fontWeight(.bold)
                            .padding(.horizontal, 10)
                            .foregroundColor(self.selected == i ? Color.blue : Color.black.opacity(0.6))
                    }).buttonStyle(PlainButtonStyle())
                    
                    if i < options.count - 1 {
                        Divider()
                            .frame(width: nil, height: 45, alignment: .center)
                            .opacity(0.7)
                    }
                    
                }
            }
            .padding(.top, 10)
            .padding(.horizontal, 15)
            .background(Color.white)
            .cornerRadius(8)
            .offset(x: geo.size.height * -0.65, y: -10)
            .rotationEffect(Angle(degrees: -90), anchor: .topLeading)
        }
    }
}
