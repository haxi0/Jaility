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
            }.navigationTitle("Other")
        }
    }
}

struct OtherView_Previews: PreviewProvider {
    static var previews: some View {
        OtherView()
    }
}
