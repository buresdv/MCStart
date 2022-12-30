//
//  MCStartApp.swift
//  MCStart
//
//  Created by David Bureš on 25.11.2022.
//

import SwiftUI

@main
struct MCStartApp: App {
    
    @NSApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .commands {
            SidebarCommands()
            
            CommandGroup(after: .appInfo) {
                
            }
            
            CommandGroup(replacing: CommandGroupPlacement.appInfo) {
                Button(action: {
                    appDelegate.showAboutPanel()
                }) {
                    Text("About \(NSApplication.appName!)")
                }
            }
        }
        
        Settings {
            SettingsView()
        }
    }
}
