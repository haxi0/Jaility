//
//  ContentView.swift
//  Jaility
//
//  Created by Анохин Юрий on 19.10.2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            TweaksView()
                .tabItem {
                    Image(systemName: "hammer.fill")
                    Text("Tweaks")
                }
            ThemesView()
                .tabItem {
                    Image(systemName: "bag.fill")
                    Text("Themes")
                }
            OtherView()
                .tabItem {
                    Image(systemName: "ellipsis")
                    Text("Other")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
