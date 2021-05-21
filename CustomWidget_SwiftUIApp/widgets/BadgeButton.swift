//
//  BadgeButton.swift
//  AnimatedIndicator
//
//  Created by MacBook Pro on 2021/5/21.
//

import SwiftUI

struct BadgeButton: View {
    var icon : String = ""
    @Binding var badgeValue: Int
    @Binding var action: Bool
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            Button("") {
                withAnimation {
                    self.action.toggle()
                }
            }
            .frame(width: 44, height: 44)
            .background(
                Image("\(icon)")
//                    .resizable()
//                    .aspectRatio(contentMode: .fit)
                    .background(icon.isEmpty ? Color.blue : Color.clear)
            )
            .background(Color.clear)
            
            Text(badgeValue > 0 ? "\(badgeValue)" : "")
                .font(.system(size: 13))
                .fontWeight(.bold)
                .lineLimit(1)
                .padding(EdgeInsets(top: 2, leading: 6, bottom: 2, trailing: 6))
                .frame(maxWidth:badgeValue > 9 ? 30 : 20,maxHeight: 20)
                .foregroundColor(badgeValue > 0 ? Color.white : Color.clear)
                .background(badgeValue > 0 ? Color.red : Color.clear)
                .clipShape(Capsule())
                .alignAsBadge()

        }
    }
}


