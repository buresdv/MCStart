//
//  Decode From File.swift
//  MCStart
//
//  Created by David Bureš on 03.12.2022.
//

import Foundation

enum DecodingError: Error {
    case failedToReadFile
    case failedtoDecodeFromBase64
    case failedToCreateObject
}

func decodeDataFromDisk<T: Codable>(from filePath: String) throws -> some Codable {
    
    var finalObject: T
    
    if let data: Data = FileManager.default.contents(atPath: filePath) {
        if let decodedData = Data(base64Encoded: data) {
            let decoder = JSONDecoder()
            
            do {
                
                var decodedObject = try decoder.decode(T.self, from: decodedData)
                
                finalObject = decodedObject
                
            } catch {
                throw DecodingError.failedToCreateObject
            }
        } else {
            throw DecodingError.failedtoDecodeFromBase64
        }
    } else {
        throw DecodingError.failedToReadFile
    }
        
    return finalObject
}
