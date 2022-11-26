//
//  Initialize Folders.swift
//  MCStart
//
//  Created by David Bureš on 26.11.2022.
//

import Foundation

func initializeFolders() -> Void {
    // First, check if the Categories directory exists
    if !existsAtPath(atPath: AppGlobals.categoriesDirectoryPath.absoluteString) {
        print("Does not exist")
        // Create the Categories folder in Application Support
        do {
            try FileManager.default.createDirectory(at: AppGlobals.categoriesDirectoryPath, withIntermediateDirectories: true)
        } catch let error as NSError {
            print("Failed while creating the categories folder at \(AppGlobals.categoriesDirectoryPath): \n \(error)")
        }
    } else {
        print("Categories folder exists")
    }
}
