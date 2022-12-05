//
//  Get Path to Metadata File.swift
//  MCStart
//
//  Created by David Bureš on 05.12.2022.
//

import Foundation

enum MetadataAccessError: Error {
    case metadataFileNotFound
}

func getPathToMetadataFile(in folder: URL, checkIfMetadataFileAlreadyExists: Bool) throws -> URL {
    
    var metadataFilePath: URL
    
    let metadataFileLocation: URL = folder.appendingPathComponent("Metadata", conformingTo: .data)
    
    if checkIfMetadataFileAlreadyExists {
        if FileManager.default.fileExists(atPath: metadataFileLocation.path) {
            metadataFilePath = metadataFileLocation
        } else {
            throw MetadataAccessError.metadataFileNotFound
        }
    } else {
        metadataFilePath = metadataFileLocation
    }
    
    return metadataFilePath
}

