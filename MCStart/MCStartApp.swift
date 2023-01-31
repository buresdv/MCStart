//
//  MCStartApp.swift
//  MCStart
//
//  Created by David Bureš on 25.11.2022.
//

import SwiftUI

@main
struct MCStartApp: App
{
    @NSApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

    @StateObject var appState = AppState()

    var body: some Scene
    {
        WindowGroup
        {
            ContentView(appState: appState)
        }
        .commands
        {
            SidebarCommands()

            CommandGroup(after: .appInfo)
            {}

            CommandGroup(replacing: CommandGroupPlacement.appInfo)
            {
                Button(action: {
                    appDelegate.showAboutPanel()
                })
                {
                    Text("About \(NSApplication.appName!)")
                }
            }

            CommandMenu("Categories")
            {
                Button
                {
                    appState.isShowingAddCategorySheet.toggle()
                } label: {
                    Text("Add Category")
                }
                .keyboardShortcut("n", modifiers: [.command, .shift])
            }

            CommandMenu("Instances")
            {
                Button
                {
                    appState.isShowingAddInstanceSheet.toggle()
                } label: {
                    Text("Add Instance")
                }
                .keyboardShortcut("n")
            }
        }

        Settings
        {
            SettingsView()
        }
    }
}
