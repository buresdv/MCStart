//
//  ContentView.swift
//  MCStart
//
//  Created by David Bureš on 25.11.2022.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var instanceCategories = InstanceCategories()
    
    var body: some View {
        NavigationView {
            SidebarView(instanceCategories: instanceCategories)
            Text("no Category Selected")
            Text("No Instance Selected")
        }
        .environmentObject(instanceCategories)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
