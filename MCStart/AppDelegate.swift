//
//  AppDelegate.swift
//  MCStart
//
//  Created by David Bureš on 30.12.2022.
//

import Foundation
import AppKit
import SwiftUI
import MSAL

class AppDelegate: NSObject, NSApplicationDelegate {
    
    private var aboutWindowController: NSWindowController?
    
    func showAboutPanel() {
        if aboutWindowController == nil {
            let styleMask: NSWindow.StyleMask = [.closable, .miniaturizable, .titled]
            let window = NSWindow()
            
            window.styleMask = styleMask
            window.title = "About \(NSApplication.appName!)"
            window.contentView = NSHostingView(rootView: AboutView())
            
            aboutWindowController = NSWindowController(window: window)
        }
        aboutWindowController?.window?.center()
        aboutWindowController?.showWindow(aboutWindowController?.window)
    }
}
