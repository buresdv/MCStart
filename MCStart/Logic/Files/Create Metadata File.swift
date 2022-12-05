//
//  Create Metadata File.swift
//  MCStart
//
//  Created by David Bureš on 05.12.2022.
//

import Foundation

func createMetadataFile(inFolder folder: URL, encodedData: Data) -> Void {
    
    do {
        try encodedData.write(to: getPathToMetadataFile(in: folder, checkIfMetadataFileAlreadyExists: false))
    } catch let error as NSError {
        print("Failed while saving metadata to file: \(error)")
    }
}
