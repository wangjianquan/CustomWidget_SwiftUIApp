//
//  SearchKeyword.swift
//  CustomWidget_SwiftUIApp
//
//  Created by MacBook Pro on 2021/5/31.
//

import SwiftUI

struct SearchKeyword: View {
    var name: String
    var color: Color = .blue
    var type: SearchKeywordType = .normal

    enum SearchKeywordType {
        case normal
        case removable(()->())
    }
    
    var body: some View {
        HStack{
            Text(name)
                .font(Font.caption.bold())
            
            switch type {
                case .removable( let callback):
                    Image(systemName: "xmark")
                        .resizable()
                        .frame(width: 8, height: 8, alignment: .center)
                        .font(Font.caption.bold())
                        .onTapGesture {
                            callback()
                        }
                default:
                    EmptyView()
            }
        }
        .padding(.horizontal, 10)
        .padding(.vertical, 5)
        .background(color)
        .cornerRadius(20)
    }
}

//struct SearchKeyword_Previews: PreviewProvider {
//    static var previews: some View {
//        SearchKeyword()
//    }
//}
