//
//  Initialize Folders.swift
//  MCStart
//
//  Created by David Bureš on 26.11.2022.
//

import Foundation

func initializeFolders(categoryTracker: InstanceCategories)
{
    var categoryPaths: [URL] = []

    print("Folder: \(AppGlobals.applicationSupportDirectoryPath.path)")

    /// If the app's folder doesn't exist in Application Support, create it
    if !FileManager.default.fileExists(atPath: AppGlobals.applicationSupportDirectoryPath.path)
    {
        /// If it does not, create it and initialize it
        do
        {
            /// Step 1: Create the folder in Application Support
            print("Application Support directory for MCStart not found")
            print("Creating directory in Application SUpport...")

            try FileManager.default.createDirectory(at: AppGlobals.applicationSupportDirectoryPath, withIntermediateDirectories: false)

            /// Step 2: Create the folder for Categories inside the app's Application Support directory
            do
            {
                try FileManager.default.createDirectory(at: AppGlobals.categoriesDirectoryPath, withIntermediateDirectories: false)
            }
            catch let error as NSError
            {
                print("Failed creating Categories folder in Application Support: \(error)")
            }
        }
        catch let error as NSError
        {
            print("Failed creating folder in Application Support: \(error)")
        }
    }

    print("Application Support folder exists")

    print("Categories folder exists")

    do
    {
        let categoriesFolders: [URL] = try FileManager.default.contentsOfDirectory(at: AppGlobals.categoriesDirectoryPath, includingPropertiesForKeys: nil, options: [.skipsHiddenFiles])

        for categoryFolderPath in categoriesFolders
        {
            print("Category folder path: \(categoryFolderPath)")

            let metadataFilePath: URL = categoryFolderPath.appendingPathComponent("Metadata", conformingTo: .data)

            let metadataFilePathAsString: String = metadataFilePath.path

            if FileManager.default.fileExists(atPath: metadataFilePathAsString)
            {
                print("[Y] Metadata file at \(metadataFilePathAsString) exists")

                categoryPaths.append(metadataFilePath)
            }
            else
            {
                print("[X] Metadata file at \(metadataFilePathAsString) does NOT exist")

                let burnerMetadataContents = InstanceCategory(name: "Test", iconSymbolName: "plus", instances: [])

                let encoder = JSONEncoder()

                do
                {
                    print("About to encode")

                    let encodedData = try encodeDataForSaving(from: burnerMetadataContents)

                    do
                    {
                        try encodedData.write(to: metadataFilePath)
                    }
                    catch let error as NSError
                    {
                        print("Failed while saving metadata to file: \(error)")
                    }
                }
                catch let error as NSError
                {
                    print("Failed while encoding data: \(error)")
                }
            }
        }

        print("Category Paths: \(categoryPaths)")

        let initializedCategories: [InstanceCategory] = try decodeCategoriesFromDisk(atPaths: categoryPaths)

        categoryTracker.categories = initializedCategories

        print("Initialized Instances: \(initializedCategories)")
    }
    catch let error as NSError
    {
        print("Error: \(error)")
    }
}
