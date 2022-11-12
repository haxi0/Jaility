//
//  TweaksView.swift
//  Jaility
//
//  Created by Анохин Юрий on 19.10.2022.
//

import SwiftUI

func checkSandbox() -> Bool {
    let fileManager = FileManager.default
    fileManager.createFile(atPath: "/var/mobile/org.haxi0.Jaility", contents: nil)
    if fileManager.fileExists(atPath: "/var/mobile/org.haxi0.Jaility") {
        do {
            try fileManager.removeItem(atPath: "/var/mobile/org.haxi0.Jaility")
        } catch {
            print("Failed to remove sandbox check file")
        }
        return false
    }
    
    return true
}

struct TweaksView: View {
    @State private var isSandboxed = checkSandbox()
    @State private var showingAlert = false
    
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Modifications")) {
                    Button("Supervise Your Device") {
                        showingAlert.toggle()
                        writeToFileWithContents(contents: "<?xml version=\"1.0\" encoding=\"UTF-8\"?> <!DOCTYPE plist PUBLIC \"-//Apple//DTD PLIST 1.0//EN\" \"http://www.apple.com/DTDs/PropertyList-1.0.dtd\"> <plist version=\"1.0\"> <dict> <key>AllowPairing</key> <true/> <key>CloudConfigurationUIComplete</key> <true/> <key>ConfigurationSource</key> <integer>0</integer> <key>IsSupervised</key> <true/> <key>PostSetupProfileWasInstalled</key> <true/> </dict> </plist>", filepath: "/var/containers/Shared/SystemGroup/systemgroup.com.apple.configurationprofiles/Library/ConfigurationProfiles/CloudConfigurationDetails.plist")
                    }
                    .alert(isPresented: $showingAlert) {
                        Alert(
                            title: Text("Success!"),
                            message: Text("The changes were successfully made, it is recommended to respring now."),
                            primaryButton: .default(
                                Text("Respring"),
                                action: {
                                    guard let window = UIApplication.shared.windows.first else { return }
                                    while true {
                                        window.snapshotView(afterScreenUpdates: false)
                                    }
                                }
                            ),
                            secondaryButton: .default(
                                Text("Exit the app"),
                                action: {
                                    DispatchQueue.main.asyncAfter(deadline: .now()) {
                                        UIApplication.shared.perform(#selector(NSXPCConnection.suspend))
                                    }
                                }
                            )
                        )
                    }
                    Button("Disable Locking After Respring") {
                        showingAlert.toggle()
                        writeToFileWithContents(contents: "<?xml version=\"1.0\" encoding=\"utf-8\"?> <!DOCTYPE plist PUBLIC \"-//Apple Computer//DTD PLIST 1.0//EN\" \"apple.com/DTDs/PropertyList-1.0.dtd\"> <plist version=\"1.0\"> <dict> <key>SBDontLockAfterCrash</key> <true/> </dict> </plist>", filepath: "/var/Managed Preferences/mobile/com.apple.springboard.plist")
                    }
                    .alert(isPresented: $showingAlert) {
                        Alert(
                            title: Text("Success!"),
                            message: Text("The changes were successfully made, it is recommended to respring now."),
                            primaryButton: .default(
                                Text("Respring"),
                                action: {
                                    guard let window = UIApplication.shared.windows.first else { return }
                                    while true {
                                        window.snapshotView(afterScreenUpdates: false)
                                    }
                                }
                            ),
                            secondaryButton: .default(
                                Text("Exit the app"),
                                action: {
                                    DispatchQueue.main.asyncAfter(deadline: .now()) {
                                        UIApplication.shared.perform(#selector(NSXPCConnection.suspend))
                                    }
                                }
                            )
                        )
                    }
                    Button("Show The Mute Switch In Control Center") {
                        showingAlert.toggle()
                        writeToFileWithContents(contents: "<?xml version=\"1.0\" encoding=\"UTF-8\"?> <!DOCTYPE plist PUBLIC \"-//Apple//DTD PLIST 1.0//EN\" \"http://www.apple.com/DTDs/PropertyList-1.0.dtd\"> <plist version=\"1.0\"> <dict> <key>SBIconVisibility</key> <true/> </dict> </plist>", filepath: "/var/Managed Preferences/mobile/com.apple.control-center.MuteModule.plist")
                    }
                    .alert(isPresented: $showingAlert) {
                        Alert(
                            title: Text("Success!"),
                            message: Text("The changes were successfully made, you can now add the mute switch to control center. It is recommended to respring now."),
                            primaryButton: .default(
                                Text("Respring"),
                                action: {
                                    guard let window = UIApplication.shared.windows.first else { return }
                                    while true {
                                        window.snapshotView(afterScreenUpdates: false)
                                    }
                                }
                            ),
                            secondaryButton: .default(
                                Text("Exit the app"),
                                action: {
                                    DispatchQueue.main.asyncAfter(deadline: .now()) {
                                        UIApplication.shared.perform(#selector(NSXPCConnection.suspend))
                                    }
                                }
                            )
                        )
                    }
                }.disabled(isSandboxed)
                
                Section(header: Text("Remove Modifications"), footer: Text("If you don't know what these tweaks and modifications do, don't apply them!")) {
                    Button("Unsupervise Your Device") {
                        showingAlert.toggle()
                        writeToFileWithContents(contents: "<?xml version=\"1.0\" encoding=\"UTF-8\"?> <!DOCTYPE plist PUBLIC \"-//Apple//DTD PLIST 1.0//EN\" \"http://www.apple.com/DTDs/PropertyList-1.0.dtd\"> <plist version=\"1.0\"> <dict> <key>AllowPairing</key> <true/> <key>CloudConfigurationUIComplete</key> <true/> <key>ConfigurationSource</key> <integer>0</integer> <key>IsSupervised</key> <false/> <key>PostSetupProfileWasInstalled</key> <true/> </dict> </plist>", filepath: "/var/containers/Shared/SystemGroup/systemgroup.com.apple.configurationprofiles/Library/ConfigurationProfiles/CloudConfigurationDetails.plist")
                    }
                    .alert(isPresented: $showingAlert) {
                        Alert(
                            title: Text("Success!"),
                            message: Text("The changes were successfully made, it is recommended to respring now."),
                            primaryButton: .default(
                                Text("Respring"),
                                action: {
                                    guard let window = UIApplication.shared.windows.first else { return }
                                    while true {
                                        window.snapshotView(afterScreenUpdates: false)
                                    }
                                }
                            ),
                            secondaryButton: .default(
                                Text("Exit the app"),
                                action: {
                                    DispatchQueue.main.asyncAfter(deadline: .now()) {
                                        UIApplication.shared.perform(#selector(NSXPCConnection.suspend))
                                    }
                                }
                            )
                        )
                    }
                    Button("Enable Locking After Respring") {
                        showingAlert.toggle()
                        writeToFileWithContents(contents: "Placeholder text that was edited by Jaility.", filepath: "/var/Managed Preferences/mobile/com.apple.springboard.plist")
                    }
                    .alert(isPresented: $showingAlert) {
                        Alert(
                            title: Text("Success!"),
                            message: Text("The changes were successfully made, it is recommended to respring now."),
                            primaryButton: .default(
                                Text("Respring"),
                                action: {
                                    guard let window = UIApplication.shared.windows.first else { return }
                                    while true {
                                        window.snapshotView(afterScreenUpdates: false)
                                    }
                                }
                            ),
                            secondaryButton: .default(
                                Text("Exit the app"),
                                action: {
                                    DispatchQueue.main.asyncAfter(deadline: .now()) {
                                        UIApplication.shared.perform(#selector(NSXPCConnection.suspend))
                                    }
                                }
                            )
                        )
                    }
                    Button("Hide The Mute Switch In Control Center") {
                        showingAlert.toggle()
                        writeToFileWithContents(contents: "Placeholder text that was edited by Jaility.", filepath: "/var/Managed Preferences/mobile/com.apple.control-center.MuteModule.plist")
                    }
                    .alert(isPresented: $showingAlert) {
                        Alert(
                            title: Text("Success!"),
                            message: Text("The changes were successfully made, it is recommended to respring now."),
                            primaryButton: .default(
                                Text("Respring"),
                                action: {
                                    guard let window = UIApplication.shared.windows.first else { return }
                                    while true {
                                        window.snapshotView(afterScreenUpdates: false)
                                    }
                                }
                            ),
                            secondaryButton: .default(
                                Text("Exit the app"),
                                action: {
                                    DispatchQueue.main.asyncAfter(deadline: .now()) {
                                        UIApplication.shared.perform(#selector(NSXPCConnection.suspend))
                                    }
                                }
                            )
                        )
                    }
                }.disabled(isSandboxed)
            }.navigationTitle("Tweaks")
        }
    }
    
    func writeToFileWithContents(contents: String, filepath: String) {
        let fileManager = FileManager.default
        let url = URL(fileURLWithPath: filepath)
        fileManager.createFile(atPath: filepath, contents: nil)
        do {
            try contents.write(to: url, atomically: true, encoding: .utf8)
        }
        catch {
            print("error")
        }
    }
    
    struct TweaksView_Previews: PreviewProvider {
        static var previews: some View {
            TweaksView()
        }
    }
}
