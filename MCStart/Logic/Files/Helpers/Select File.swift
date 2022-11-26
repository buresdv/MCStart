//
//  Select File.swift
//  MCStart
//
//  Created by David Bureš on 26.11.2022.
//

import Foundation
import AppKit

enum FilePickerResults: Error {
    case success
    case failure
}

func selectFile(canChooseFiles: Bool, canChooseDirectories: Bool, title: String? = nil) throws -> URL {
    let panel = NSOpenPanel()
    
    panel.allowsMultipleSelection = false
    panel.canChooseFiles = canChooseFiles
    panel.canChooseDirectories = canChooseDirectories
    
    if let panelTitle = title {
        panel.title = panelTitle
    }
    
    if panel.runModal() == .OK {
        return panel.url!
    } else {
        throw FilePickerResults.failure
    }
}
