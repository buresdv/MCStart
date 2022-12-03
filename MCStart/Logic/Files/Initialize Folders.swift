//
//  Initialize Folders.swift
//  MCStart
//
//  Created by David Bureš on 26.11.2022.
//

import Foundation

func initializeFolders() -> Void {
    // First, check if the Categories directory exists
    if FileManager.default.fileExists(atPath: AppGlobals.categoriesDirectoryPath.absoluteString) {
        print("Does not exist")
        // Create the Categories folder in Application Support
        do {
            try FileManager.default.createDirectory(at: AppGlobals.categoriesDirectoryPath, withIntermediateDirectories: true)
        } catch let error as NSError {
            print("Failed while creating the categories folder at \(AppGlobals.categoriesDirectoryPath): \n \(error)")
        }
    } else {
        print("Categories folder exists")
        
        do {
            
            let categoriesFolders = try FileManager.default.contentsOfDirectory(at: AppGlobals.categoriesDirectoryPath, includingPropertiesForKeys: nil, options: [.skipsHiddenFiles])
            
            for categoryFolderPath in categoriesFolders {
                print(categoryFolderPath)
                
                let metadataFilePath: String = "\(categoryFolderPath)Metadata"
                
                if FileManager.default.fileExists(atPath: metadataFilePath) {
                    
                    print("Metadata file at \(metadataFilePath) exists")
                    
                    print(decodeDataFromDisk(from: metadataFilePath))
                    
                } else {
                    
                    print("Metadata file at \(metadataFilePath) does NOT exist")
                    
                    let burnerMetadataContents: InstanceCategory = InstanceCategory(name: "Test", iconSymbolName: "plus", instances: [])
                    
                    let encoder = JSONEncoder()
                        
                    do {
                        
                        print("About to encode")
                        
                        var encodedData = try encodeDataForSaving(from: burnerMetadataContents)
                        
                        do {
                            try encodedData.write(to: URL(string: metadataFilePath)!)
                        } catch let error as NSError {
                            print("Failed while saving metadata to file: \(error)")
                        }
                        
                    } catch let error as NSError {
                        print("Failed while encoding data: \(error)")
                    }

                    
                    
                }
            }
            
        } catch let error as NSError {
            print("Error: \(error)")
        }
        
    }
}
