//
//  AppView.swift
//  AppDemo_SwiftUI
//
//  Created by MacBook Pro on 2020/10/16.
//


// MARK: - Tab
extension AppView {
    enum Tab {
        case home
        case video
        case discover
        case message
        case profile
    }
}

import SwiftUI
//tabbar_home_highlighted,tabbar_video_selected,tabbar_discover_selected,tabbar_message_center_selected,tabbar_profile_selected
struct AppView: View {
    @State private var selection: Tab = .home
    
    var body: some View {
        
        TabView(selection: $selection) {
            HomeView()
                .tabItem {
                    Label("首页", systemImage: "house.fill")
                }.tag(Tab.home)

            
            NavigationView {
                VideoView()
            }.tabItem {
                Label("视频", systemImage: "video.fill")
            }.tag(Tab.video)
            
            NavigationView {
                FindView()
                    .navigationBarTitle("发现", displayMode: .inline)
            }
            .tabItem {
                
//                Label("发现", image: "tabbar_discover_selected")
                Label("发现", systemImage: "magnifyingglass.circle.fill")
            }.tag(Tab.discover)

            NavigationView {
                MessageView()
            }.tabItem {
//                Label("消息", image: "tabbar_message_center_selected")
                Label("消息", systemImage: "message.fill")
            }.tag(Tab.message)
            
            NavigationView {
                MyView()
            }.tabItem{
                Label("我", systemImage: "person.fill")
            }.tag(Tab.profile)
        }
    }
}

struct AppView_Previews: PreviewProvider {
    static var previews: some View {
        AppView()
    }
}
