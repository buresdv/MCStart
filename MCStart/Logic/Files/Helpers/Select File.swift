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

func selectFile(canChooseFiles: Bool, canChooseDirectories: Bool, canChooseMultipleFiles: Bool, title: String? = nil, fileExtension: [String]? = nil) throws -> URL {
    let panel = NSOpenPanel()
    
    panel.allowsMultipleSelection = canChooseMultipleFiles
    
    panel.canChooseFiles = canChooseFiles
    panel.canChooseDirectories = canChooseDirectories
    
    if let panelTitle = title {
        panel.title = panelTitle
    }
    
    if let selectedFileTypes = fileExtension {
        panel.allowedFileTypes = selectedFileTypes
    }

    if panel.runModal() == .OK {
        return panel.url!
    } else {
        throw FilePickerResults.failure
    }
}
