//
//  MessageView.swift
//  AppDemo_SwiftUI
//
//  Created by MacBook Pro on 2020/10/22.
//

import SwiftUI

struct MessageView: View {
    var body: some View {
        List {
            ForEach(0...20, id: \.self) { (id) in
                Text("消息")
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        
        .toolbar { // 这与navigationItem.titleViewUIKit 中的设置相同。
            ToolbarItem(placement: .principal) {
//                VStack {
//                    Text("Title").font(.headline)
//                    Text("Subtitle").font(.subheadline)
//                }
                HStack {
                    Image(systemName: "sun.min.fill")
                    Button("Subtitle") {
                                            
                    }
                }
                
            }
        }
        .toolbar {
            ToolbarItem(placement: .bottomBar) {
                HStack {
                    Button(action: {}, label: {
                        Image(systemName: "archivebox")
                    })
                    Spacer()
                    Button(action: {}, label: {
                        
                        Image(systemName: "square.and.pencil")
                    })
                }
            }
        }
    }
}

struct MessageView_Previews: PreviewProvider {
    static var previews: some View {
        MessageView()
    }
}
