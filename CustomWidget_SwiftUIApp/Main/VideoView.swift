//
//  VideoView.swift
//  AppDemo_SwiftUI
//https://swiftwithmajid.com/2020/05/13/template-view-pattern-in-swiftui/?utm_campaign=%20SwiftUI%20Weekly&utm_medium=email&utm_source=Revue%20newsletter
//  Created by MacBook Pro on 2020/10/22.
//

import SwiftUI

struct VideoView: View {
    private let heartRates: [Int] = [33,24,78,0,12,0,0,33,24,78]

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false, content: {
            VStack(alignment: .center, spacing: 15, content: {
                Button(action: { print("Hello!")}) {
                    HStack {
                        Text("00")
                            .font(.title)
                            .hidden()
                            .overlay(
                                Image("VersionUpdate_Icon")
                                    .resizable()
                                    .scaledToFit()
                            )
                        Text("Press me")
                    }
                }
                HStack {
                    ForEach(self.heartRates, id: \.self) { hr in
                        Text("190")
                            .hidden()
                            .padding(4)
                            .background(Color.purple)
                            .cornerRadius(4)
                            .overlay(Text(String(hr)))
                    }
                }.border(Color.red)
            })
            
        })
        .toolbar {
            ToolbarItem(placement: .bottomBar) {
                Button(action: {}, label: {
                    Image(systemName: "archivebox")
                })
            }
            ToolbarItem(placement: .bottomBar) {
                Spacer()
            }
            ToolbarItem(placement: .bottomBar) {
                Button(action: {}, label: {
                    Image(systemName: "square.and.pencil")
                })
            }
            
        }
    }
}

struct VideoView_Previews: PreviewProvider {
    static var previews: some View {
        VideoView()
    }
}
