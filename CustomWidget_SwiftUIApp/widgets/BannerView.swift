//
//  BannerView.swift
//  CustomWidget_SwiftUIApp
//
//  Created by MacBook Pro on 2021/1/22.
//

import SwiftUI

struct Banner: Identifiable {
    var id: Int?
    var img: String?
    var name: String?
    var show: Bool?
}

struct BannerView: View {
    var data: Banner
    
    var body: some View {
//        GeometryReader(content: { geometry in
            VStack(alignment: .leading, spacing: 0) {
               
                Image(data.img ?? "")
                    .resizable()
//                    .scaledToFit()
//                    .frame(width: geometry.size.width, height: geometry.size.height-30)
                    .frame(width: UIScreen.main.bounds.width - 30, height: 240)

                Text(data.name ?? "")
                    .fontWeight(.bold)
                    .padding(.vertical,13)
                    .padding(.leading)
            }
//            .background(Color.red)
            .cornerRadius(23)
//        })
        
    }
}




