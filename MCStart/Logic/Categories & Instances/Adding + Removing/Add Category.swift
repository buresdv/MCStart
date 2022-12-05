//
//  Add Category.swift
//  MCStart
//
//  Created by David Bureš on 05.12.2022.
//

import Foundation
import SwiftUI

func addCategory(newCategory: InstanceCategory, categoryTracker: InstanceCategories) -> Void {
    
    /// Just show the user a cool animation to it loks instant
    withAnimation {
        categoryTracker.categories.append(newCategory)
    }
    
    /// Here all the magic begins
    do {
        /// Create a new folder in Application Support with the name of the folder
        let pathToNewCategory: URL = AppGlobals.categoriesDirectoryPath.appendingPathComponent(newCategory.name, conformingTo: .directory)
        
        try FileManager.default.createDirectory(at: pathToNewCategory, withIntermediateDirectories: false)
        
        do {
            /// Encode the new category
            let encodedData: Data = try encodeDataForSaving(from: newCategory)
            
            /// Create the metadata file for that new category, and save it to the filesystem
            createMetadataFile(inFolder: pathToNewCategory, encodedData: encodedData)
            
        } catch let error as NSError {
            print("Failed while encoding the new category: \(error)")
        }
        
    } catch let error as NSError {
        print("Failed while creating folder for the new category: \(error)")
    }
}
