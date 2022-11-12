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
