//
//  Toggle Sidebar.swift
//  MCStart
//
//  Created by David Bureš on 25.11.2022.
//

import AppKit
import Foundation

func toggleSidebar()
{
    NSApp.keyWindow?.firstResponder?.tryToPerform(#selector(NSSplitViewController.toggleSidebar(_:)), with: nil)
}
