//
//  ThemesView.swift
//  Jaility
//
//  Created by Анохин Юрий on 19.10.2022.
//

import SwiftUI
import ZIPFoundation

struct ThemesView: View {
    @State private var FelicityClicked = false
    @State private var modernOSClicked = false
    @State private var isSandboxed = checkSandbox()
    @State private var showingAlert = false
    
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Themes")) {
                    Button(action: {
                        let url = URL(string: "https://haxi0-dev.com/assets/FelicityPro.zip")
                        let webClipsPath = URL(string: "/var/mobile/Library/WebClips/FelicityPro.zip")
                        let webClipsDecomP = URL(string: "/var/mobile/Library/WebClips/")
                        Bundle.main.path(forResource: "FelicityPro", ofType: "zip")
                        let fm = FileManager.default
                        let docsurl = try! fm.url(for:.documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
                        let myurl = docsurl.appendingPathComponent("FelicityPro.zip")
                        FelicityClicked = true
                        FileDownloader.loadFileAsync(url: url!) { (path, error) in
                            print(".zip File downloaded to : \(path!)")
                            print(webClipsPath!.path)
                            print(myurl.path)
                            let fileManager = FileManager()
                            var sourceURL = URL(fileURLWithPath: webClipsDecomP!.path)
                            sourceURL.appendPathComponent("FelicityPro.zip")
                            var destinationURL = URL(fileURLWithPath: webClipsDecomP!.path)
                            do {
                                if FileManager.default.fileExists(atPath: myurl.path) {
                                    try FileManager.default.moveItem(atPath: myurl.path, toPath: webClipsPath!.path)
                                    try fileManager.unzipItem(at: sourceURL, to: destinationURL)
                                    FelicityClicked = false
                                }
                            } catch {
                                FelicityClicked = false
                                print("oops")
                            }
                        }
                    }) {
                        Label {
                            Text("Felicity Pro")
                        } icon: {
                            Image("Felicity-Pro-Icon")
                                .resizable()
                                .scaledToFit()
                        }
                    }.allowsHitTesting(FelicityClicked)
                        .disabled(FelicityClicked)
                        .disabled(isSandboxed)
                    
                    Button(action: {
                        let url = URL(string: "https://haxi0-dev.com/assets/modernOS.zip")
                        let webClipsPath = URL(string: "/var/mobile/Library/WebClips/modernOS.zip")
                        let webClipsDecomP = URL(string: "/var/mobile/Library/WebClips/")
                        Bundle.main.path(forResource: "modernOS", ofType: "zip")
                        let fm = FileManager.default
                        let docsurl = try! fm.url(for:.documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
                        let myurl = docsurl.appendingPathComponent("modernOS.zip")
                        modernOSClicked = true
                        FileDownloader.loadFileAsync(url: url!) { (path, error) in
                            print(".zip File downloaded to : \(path!)")
                            print(webClipsPath!.path)
                            print(myurl.path)
                            let fileManager = FileManager()
                            var sourceURL = URL(fileURLWithPath: webClipsDecomP!.path)
                            sourceURL.appendPathComponent("modernOS.zip")
                            var destinationURL = URL(fileURLWithPath: webClipsDecomP!.path)
                            do {
                                if FileManager.default.fileExists(atPath: myurl.path) {
                                    try FileManager.default.moveItem(atPath: myurl.path, toPath: webClipsPath!.path)
                                    try fileManager.unzipItem(at: sourceURL, to: destinationURL)
                                    modernOSClicked = false
                                }
                            } catch {
                                modernOSClicked = false
                                print("oops")
                            }
                        }
                    }) {
                        Label {
                            Text("modernOS")
                        } icon: {
                            Image("modernOS-Icon")
                                .resizable()
                                .scaledToFit()
                        }
                    }.allowsHitTesting(modernOSClicked)
                        .disabled(modernOSClicked)
                        .disabled(isSandboxed)
                }.navigationTitle("Theme Store")
            }
        }
    }
    
    class FileDownloader {
        
        static func loadFileSync(url: URL, completion: @escaping (String?, Error?) -> Void)
        {
            let documentsUrl = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
            
            let destinationUrl = documentsUrl.appendingPathComponent(url.lastPathComponent)
            
            if FileManager().fileExists(atPath: destinationUrl.path)
            {
                print("File already exists [\(destinationUrl.path)]")
                completion(destinationUrl.path, nil)
            }
            else if let dataFromURL = NSData(contentsOf: url)
            {
                if dataFromURL.write(to: destinationUrl, atomically: true)
                {
                    print("file saved [\(destinationUrl.path)]")
                    completion(destinationUrl.path, nil)
                }
                else
                {
                    print("error saving file")
                    let error = NSError(domain:"Error saving file", code:1001, userInfo:nil)
                    completion(destinationUrl.path, error)
                }
            }
            else
            {
                let error = NSError(domain:"Error downloading file", code:1002, userInfo:nil)
                completion(destinationUrl.path, error)
            }
        }
        
        static func loadFileAsync(url: URL, completion: @escaping (String?, Error?) -> Void)
        {
            let documentsUrl =  FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
            
            let destinationUrl = documentsUrl.appendingPathComponent(url.lastPathComponent)
            
            if FileManager().fileExists(atPath: destinationUrl.path)
            {
                print("File already exists [\(destinationUrl.path)]")
                completion(destinationUrl.path, nil)
            }
            else
            {
                let session = URLSession(configuration: URLSessionConfiguration.default, delegate: nil, delegateQueue: nil)
                var request = URLRequest(url: url)
                request.httpMethod = "GET"
                let task = session.dataTask(with: request, completionHandler:
                                                {
                    data, response, error in
                    if error == nil
                    {
                        if let response = response as? HTTPURLResponse
                        {
                            if response.statusCode == 200
                            {
                                if let data = data
                                {
                                    if let _ = try? data.write(to: destinationUrl, options: Data.WritingOptions.atomic)
                                    {
                                        completion(destinationUrl.path, error)
                                    }
                                    else
                                    {
                                        completion(destinationUrl.path, error)
                                    }
                                }
                                else
                                {
                                    completion(destinationUrl.path, error)
                                }
                            }
                        }
                    }
                    else
                    {
                        completion(destinationUrl.path, error)
                    }
                })
                task.resume()
            }
        }
    }
}

struct ThemesView_Previews: PreviewProvider {
    static var previews: some View {
        ThemesView()
    }
}
