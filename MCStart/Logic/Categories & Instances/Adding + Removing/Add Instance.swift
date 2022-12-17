//
//  Add Instance.swift
//  MCStart
//
//  Created by David Bureš on 05.12.2022.
//

import Foundation
import SwiftUI

#warning("This function is basically the same thing as the Add Category function. Maybe merge them somehow?")
func addInstance(newInstance: Instance, parentCategoryUUID: UUID, instanceTracker: inout [Instance]) -> Void {
    
    instanceTracker.append(newInstance)
    
    let pathToParentCategory: URL = getPathToCategoryFolderByUUID(categoryUUID: parentCategoryUUID)
    
    do {
        
        let pathToNewInstance: URL = pathToParentCategory.appendingPathComponent(newInstance.id.uuidString, conformingTo: .directory)
        
        try FileManager.default.createDirectory(at: pathToNewInstance, withIntermediateDirectories: false)
        
        do {
            
            let encodedData: Data = try encodeDataForSaving(from: newInstance)
            
            createMetadataFile(inFolder: pathToNewInstance, encodedData: encodedData)
            
            do {
                try FileManager.default.createDirectory(at: pathToNewInstance.appendingPathComponent("mods", conformingTo: .directory), withIntermediateDirectories: false)
            } catch let error as NSError {
                print("Error creating the mods folder: \(error)")
            }
            
        } catch let error as NSError {
            print("Failed while encoding and saving data: \(error)")
        }
        
    } catch let error as NSError {
        print("Failed while creating new instance folder: \(error)")
    }
}
