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
    
    var body: some View {
        NavigationView {
            SidebarView(instanceCategories: instanceCategories)
            Text("No Category Selected")
            Text("No Instance Selected")
        }
        .environmentObject(instanceCategories)
        .environmentObject(appState)
        .onAppear {
            print(AppGlobals.categoriesDirectoryPath)
            initializeFolders(categoryTracker: instanceCategories)
            
            Task {
                let loginPrerequisites: [String] = await getLoginPrerequisites()
                print("sFTTag: \(loginPrerequisites[0])")
                print("urlPost: \(loginPrerequisites[1])")
            }
            print(instanceCategories.categories)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
