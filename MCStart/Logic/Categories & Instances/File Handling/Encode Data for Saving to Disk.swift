//
//  Encode Data for Saving to Disk.swift
//  MCStart
//
//  Created by David Bureš on 02.12.2022.
//

import Foundation

enum EncodingError: Error {
    case failedToEncodeToJSON
    case failedToEncodeToData
}

/// This function returns the JSON- and base64-encoded data ready to be saved to disk
/// It accepts any Codable type, so, for my purposes, Categories and Instances
func encodeDataForSaving(from originalData: some Codable) throws -> Data {
    var encodedData: Data? = nil
    
    let encoder = JSONEncoder()
    
    do {
        encodedData = try encoder.encode(originalData)
        
        do {
            encodedData = encodedData?.base64EncodedData()
        } catch let error as NSError {
            throw EncodingError.failedToEncodeToData
        }
        
    } catch let error as NSError {
        throw EncodingError.failedToEncodeToJSON
    }
    
    return encodedData!
}
