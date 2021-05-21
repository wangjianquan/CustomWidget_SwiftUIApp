//
//  BannerView.swift
//  CustomWidget_SwiftUIApp
//
//  Created by MacBook Pro on 2021/1/22.
//

import SwiftUI

struct Banner: Identifiable {
    var id: Int
    var img: String
    var name: String
    var show: Bool
}

struct BannerView: View {
    
    @State var dataSource = [Banner]()
    @State var spacing: CGFloat?
    
    @State fileprivate var x : CGFloat = 0
    @State fileprivate var count : CGFloat = 0

    
    var body: some View {
        VStack(content: {
            HStack(spacing: (spacing ?? 15)) {
                ForEach(dataSource) { i in
                    CardView(data: i, spacing: spacing)
                        .offset(x: self.x)
                        .highPriorityGesture(
                            DragGesture()
                                .onChanged({ (value) in
                                    if value.translation.width > 0 {
                                        self.x = value.location.x
                                    }else {
                                        self.x = value.location.x - getScreen()
                                    }
                                })
                                .onEnded({ (value) in
                                    if value.translation.width > 0 {
                                        if value.translation.width > ((getScreen()-80) / 2) && (Int(self.count) != self.getMid()) {
                                            self.count += 1
                                            self.updateHeight(value: Int(self.count))
                                            self.x = (getScreen() + (spacing ?? 15)) * self.count
                                        }else{
                                            self.x = (getScreen() + (spacing ?? 15)) * self.count
                                        }
                                    }else {
                                        if -value.translation.width > ((getScreen()-80) / 2) && (-Int(self.count) != self.getMid()) {
                                            self.count -= 1
                                            self.updateHeight(value: Int(self.count))
                                            self.x = (getScreen() + (spacing ?? 15)) * self.count
                                        }else{
                                            self.x = (getScreen() + (spacing ?? 15)) * self.count
                                        }
                                    }
                                }))
                }
            }.background(Color.green)
        })
        .background(Color.black.opacity(0.7))
        .edgesIgnoringSafeArea(.all)
        .animation(.spring())
        .onAppear {
            self.dataSource[self.getMid()].show = true
        }
        
    }
    
    fileprivate func getScreen() -> CGFloat {
        let width = getScreenWidth() - 2 * (self.spacing ?? 15)
        return width
    }
    
    fileprivate func getMid() -> Int {
        return dataSource.count / 2
    }
    
    fileprivate func updateHeight(value: Int) {
        var id : Int
        if value < 0 {
            id = -value + getMid()
        } else {
            id = getMid() - value
        }
        for i in 0..<dataSource.count{
            dataSource[i].show = false
        }
        dataSource[id].show = true
    }
}

struct CardView: View  {
    var data: Banner
    @State var spacing: CGFloat?
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .trailing, vertical: .bottom)) {
            
            Image(data.img )
                .resizable()
                .frame(width: getScreenWidth() - 2 * (spacing ?? 15), height: data.show ? 240 : 200)

            Text(data.name)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .padding(.vertical,(spacing ?? 15))
                .padding(.horizontal,(spacing ?? 15))

                .frame(width: getScreenWidth() - 2 * (spacing ?? 15), height: 40)
                .background(Color.black.opacity(0.4))


        }
        .cornerRadius(23)
        
    }
}



