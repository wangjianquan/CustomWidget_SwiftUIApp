//
//  AppSettingsView.swift
//  CustomWidget_SwiftUIApp
//
//  Created by MacBook Pro on 2021/4/12.
//

import SwiftUI

public class Features: ObservableObject {
    public static let shared = Features()
    private init() {
    }
    
    @Published public var isDebugMenuEnabled = false
}

@propertyWrapper
public struct Feature<T>: DynamicProperty {
    @ObservedObject private var features: Features

    private let keyPath: KeyPath<Features, T>
    
    public init(_ keyPath: KeyPath<Features, T>, features: Features = .shared) {
        self.keyPath = keyPath
        self.features = features
    }

    public var wrappedValue: T {
        return features[keyPath: keyPath]
    }
}

public class AppSettings: ObservableObject {
    @AppStorage("appSetting1") public var appSetting1: Int = 42
    @AppStorage("appSetting2") public var appSetting2: String = "Hello"
}
public class SceneSettings: ObservableObject {
    @SceneStorage("sceneValue1") public var sceneSetting1: Int = 54
    @SceneStorage("sceneValue2") public var sceneSetting2: String = "World"
}


struct AppSettingsView: View {
    @Feature(\.isDebugMenuEnabled) var showDebugMenu
//    @SceneSetting(\.shouldShowThatOneInfoSection) var showInfo
    
    var body: some View {
        Form {
            if showDebugMenu {
                NavigationLink(destination: BannerTest()) { Text("Debug Settings") }
            }
        }
    }
}

struct AppSettingsView_Previews: PreviewProvider {
    static var previews: some View {
        AppSettingsView()
    }
}
