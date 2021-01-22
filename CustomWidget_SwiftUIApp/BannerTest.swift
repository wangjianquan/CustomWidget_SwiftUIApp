//
//  BannerTest.swift
//  CustomWidget_SwiftUIApp
//
//  Created by MacBook Pro on 2021/1/22.
//

import SwiftUI

struct BannerTest: View {
    var body: some View {
        NavigationView(content: {
            VStack(spacing: 0,content: {
                Spacer()
                HStack(spacing: 15) {
                    ForEach(dataSource) { i in
                        BannerView(data: i)
    //                        .frame(width: UIScreen.main.bounds.width-30, height: 240)
                    }
                }.background(Color.green)
                Spacer()
            }).background(Color.black.opacity(0.7))
            .edgesIgnoringSafeArea(.all)
        })
        
    }
}

struct BannerTest_Previews: PreviewProvider {
    static var previews: some View {
        BannerTest()
    }
}
