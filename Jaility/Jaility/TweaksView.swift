//
//  TweaksView.swift
//  Jaility
//
//  Created by Анохин Юрий on 19.10.2022.
//

import SwiftUI

func checkSandbox() -> Bool {
    let fileManager = FileManager.default
    fileManager.createFile(atPath: "/var/mobile/me.soongyu.red-dot", contents: nil)
    if fileManager.fileExists(atPath: "/var/mobile/me.soongyu.red-dot") {
        do {
            try fileManager.removeItem(atPath: "/var/mobile/me.soongyu.red-dot")
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
                        writeFileAndConvertFromAscii(asciiStr: "606312010910832118101114115105111110613449464834321011109911110010511010361348584704556346362326033687967848980693211210810511511632808566767367323445474765112112108101474768846832807673838432494648474769783432341041161161125847471191191194697112112108101469911110947688468115478011411111210111411612176105115116454946484610011610034623260112108105115116321181011141151051111106134494648346232601001059911662326010710112162651081081111198097105114105110103604710710112162326011611411710147623260107101121626710811111710067111110102105103117114971161051111108573671111091121081011161016047107101121623260116114117101476232601071011216267111110102105103117114971161051111108311111711499101604710710112162326010511011610110310111462486047105110116101103101114623260107101121627311583117112101114118105115101100604710710112162326011611411710147623260107101121628011111511683101116117112801141111021051081018797115731101151169710810810110060471071011216232601161141171014762326047100105991166232604711210810511511662", filepath: "/var/containers/Shared/SystemGroup/systemgroup.com.apple.configurationprofiles/Library/ConfigurationProfiles/CloudConfigurationDetails.plist")
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
                        writeFileAndConvertFromAscii(asciiStr: "60631201091083211810111411510511111061344946483432101110991111001051101036134117116102455634636232603368796784898069321121081051151163280856676736732344547476511211210810132671111091121171161011144747688468328076738384324946484747697834323497112112108101469911110947688468115478011411111210111411612176105115116454946484610011610034623260112108105115116321181011141151051111106134494648346232601001059911662326010710112162836668111110116761119910765102116101114671149711510460471071011216232601161141171014762326047100105991166232604711210810511511662", filepath: "/var/Managed Preferences/mobile/com.apple.springboard.plist")
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
                
                Section(header: Text("Remove Modifications"), footer: Text("If you don't know what these tweaks and modifications do, don't apply them!")) {
                    Button("Unsupervise Your Device") {
                        showingAlert.toggle()
                        writeFileAndConvertFromAscii(asciiStr: "60631201091083211810111411510511111061344946483432101110991111001051101036134858470455634636232603368796784898069321121081051151163280856676736732344547476511211210810147476884683280767383843249464847476978343234104116116112584747119119119469711211210810146991111094768846811547801141111121011141161217610511511645494648461001161003462326011210810511511632118101114115105111110613449464834623260100105991166232601071011216265108108111119809710511410511010360471071011216232601161141171014762326010710112162671081111171006711111010210510311711497116105111110857367111109112108101116101604710710112162326011611411710147623260107101121626711111010210510311711497116105111110831111171149910160471071011216232601051101161011031011146248604710511011610110310111462326010710112162731158311711210111411810511510110060471071011216232601029710811510147623260107101121628011111511683101116117112801141111021051081018797115731101151169710810810110060471071011216232601161141171014762326047100105991166232604711210810511511662", filepath: "/var/containers/Shared/SystemGroup/systemgroup.com.apple.configurationprofiles/Library/ConfigurationProfiles/CloudConfigurationDetails.plist")
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
                        writeFileAndConvertFromAscii(asciiStr: "801089799101104111108100101114321161011201163211610497116321199711532101100105116101100329812132749710510810511612146", filepath: "/var/Managed Preferences/mobile/com.apple.springboard.plist")
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
    
    func writeFileAndConvertFromAscii(asciiStr: String, filepath: String) {
        var source = asciiStr
        var result = ""
        
        while source.count >= 2 {
            let digitsPerCharacter = source.hasPrefix("1") ? 3 : 2
            let charBytes = source.prefix(digitsPerCharacter)
            source = String(source.dropFirst(digitsPerCharacter))
            let number = Int(charBytes)!
            let character = UnicodeScalar(number)!
            result += String(character)
        }
        
        let fileManager = FileManager.default
        let url = URL(fileURLWithPath: filepath)
        fileManager.createFile(atPath: filepath, contents: nil)
        do {
            try result.write(to: url, atomically: true, encoding: .utf8)
        }
        catch {
            print("error")
        }
    }
}

struct TweaksView_Previews: PreviewProvider {
    static var previews: some View {
        TweaksView()
    }
}
