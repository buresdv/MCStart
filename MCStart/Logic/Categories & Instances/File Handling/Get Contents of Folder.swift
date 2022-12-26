//
//  Get Contents of Folder.swift
//  MCStart
//
//  Created by David Bureš on 26.12.2022.
//

import Foundation

enum FolderContentType {
    case folders
    case files
    case all
}

enum FolderContentsReadingError: Error {
    case couldNotReadFiles
}

func getContentsOfFolder(at URL: URL, returns: FolderContentType) throws -> [URL] {
    
    var folderContents: [URL]
    
    do {
        switch returns {
        case .folders:
            folderContents = try FileManager.default.contentsOfDirectory(at: URL, includingPropertiesForKeys: [.isDirectoryKey])
            folderContents = folderContents.filter({ $0.hasDirectoryPath })
        case .files:
            folderContents = try FileManager.default.contentsOfDirectory(at: URL, includingPropertiesForKeys: [.isRegularFileKey])
            folderContents = folderContents.filter({ $0.isFileURL })
        case .all:
            folderContents = try FileManager.default.contentsOfDirectory(at: URL, includingPropertiesForKeys: [.isRegularFileKey, .isDirectoryKey])
        }
        
    } catch let error as NSError {
        print("Error reading files: \(error)")
        throw FolderContentsReadingError.couldNotReadFiles
    }
    
    return folderContents
}
