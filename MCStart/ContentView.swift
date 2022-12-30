//
//  ContentView.swift
//  MCStart
//
//  Created by David Bureš on 25.11.2022.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var instanceCategories = InstanceCategories()
    @StateObject var appState = AppState()
    
    @AppStorage("showOnboarding") var showOnboarding: Bool = false
    
    var body: some View {
        NavigationView {
            SidebarView(instanceCategories: instanceCategories)
            Text("No Category Selected")
            Text("No Instance Selected")
        }
        .environmentObject(instanceCategories)
        .environmentObject(appState)
        .onAppear {
            #if DEBUG
            print(AppGlobals.categoriesDirectoryPath)
            #endif
            
            initializeFolders(categoryTracker: instanceCategories)
            
            /*if let url: URL = URL(string: "https://login.microsoftonline.com/consumers/oauth2/v2.0/authorize?client_id=\(AppGlobals.clientID)&response_type=code&redirect_uri=\(AppGlobals.redirectURL)&response_mode=query&scope=offline_access%20user.read%20mail.read") {
                NSWorkspace.shared.open(url)
            }*/
            
            Task {
                //let loginPrerequisites: [String] = await getLoginPrerequisites()
                
                #if DEBUG
                //print("sFTTag: \(loginPrerequisites[0])")
                //print("urlPost: \(loginPrerequisites[1])")
                #endif
                
                //await print("Request Microsoft authorization result: \(requestMicrosoftAuthorization())")
            }
            
            #if DEBUG
            print(instanceCategories.categories)
            #endif
            
            #if DEBUG
            print("Here's what the file reading funtion found:")
            do {
                print(try getContentsOfFolder(at: URL(filePath: "/Users/david/Library/Application Support/MCStart/Categories/CB63C5F8-6F53-410A-AE3B-5CEFDA9F0932/7FC61A08-5FF1-4731-8158-4A4BD3EE7C55/mods"), returns: .files))
            } catch let error as NSError {
                print("Error reading contents of folder: \(error)")
            }
            #endif
        }
        .sheet(isPresented: $showOnboarding) {
            OnboardingView(isShowingSheet: $showOnboarding)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
