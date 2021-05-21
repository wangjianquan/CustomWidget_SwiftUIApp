//
//  BadgeImageView.swift
//  AnimatedIndicator
//
//  Created by MacBook Pro on 2021/5/21.
//

import SwiftUI

struct BadgeImageView: View {
    var icon : String = "message1"
    @Binding var badgeValue: Int
    @Binding  var action: Bool
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            Image(icon)
                .resizable()
                .frame(width: 44, height: 44)
                .padding()
                .background(Color.green)
                .cornerRadius(10)
                .foregroundColor(.white)
                .aspectRatio(contentMode: .fit)
                .onTapGesture(perform: {
                    self.action.toggle()
                })
            Text(badgeValue > 0 ? "\(badgeValue)" : "")
                .font(.system(size: 13))
                .fontWeight(.bold)
                .lineLimit(1)
                .padding(EdgeInsets(top: 2, leading: 6, bottom: 2, trailing: 6))
                .frame(maxWidth:badgeValue > 9 ? 33 : 22)
                .foregroundColor(badgeValue > 0 ? Color.white : Color.clear)
                .background(badgeValue > 0 ? Color.red : Color.clear)
                .clipShape(Capsule())
                .alignAsBadge(withRatio: 0.6)
        }
    }
}

