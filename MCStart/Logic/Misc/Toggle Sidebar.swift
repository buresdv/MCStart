//
//  Toggle Sidebar.swift
//  MCStart
//
//  Created by David Bureš on 25.11.2022.
//

import Foundation
import AppKit

func toggleSidebar() -> Void {
    NSApp.keyWindow?.firstResponder?.tryToPerform(#selector(NSSplitViewController.toggleSidebar(_:)), with: nil)
}
