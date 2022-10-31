//
//  OtherView.swift
//  Jaility
//
//  Created by Анохин Юрий on 19.10.2022.
//

import SwiftUI

struct OtherView: View {
    @Environment(\.openURL) var openURL
    
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Utilites")) {
                    Button("Respring") {
                        guard let window = UIApplication.shared.windows.first else { return }
                        while true {
                            window.snapshotView(afterScreenUpdates: false)
                        }
                    }
                }
                
                Section(header: Text("Themes")) {
                    Button("Remove Cached Felicity Pro") {
                        let fileManager = FileManager.default
                        do {
                            try fileManager.removeItem(atPath: "/var/mobile/Library/WebClips/FelicityPro.zip")
                        } catch {
                            print("error")
                        }
                    }
                    Button("Remove Cached modernOS") {
                        let fileManager = FileManager.default
                        do {
                            try fileManager.removeItem(atPath: "/var/mobile/Library/WebClips/modernOS.zip")
                        } catch {
                            print("error")
                        }
                    }
                }
                
                Section(header: Text("Licenses, links")) {
                    Button("ZIPFoundation Project") {
                        openURL(URL(string: "https://github.com/weichsel/ZIPFoundation#installation")!)
                    }
                    Button("ZIPFoundation MIT License") {
                        openURL(URL(string: "https://github.com/weichsel/ZIPFoundation/blob/development/LICENSE")!)
                    }
                }
            }.navigationTitle("Other")
        }
    }
}

struct OtherView_Previews: PreviewProvider {
    static var previews: some View {
        OtherView()
    }
}
