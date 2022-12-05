//
//  Decode From File.swift
//  MCStart
//
//  Created by David Bureš on 03.12.2022.
//

import Foundation

enum DecodingError: Error {
    case failedToAccessCategoriesFolder
    case failedToReadFile
    case failedtoDecodeFromBase64
    case failedToCreateObject
}

func decodeCategoriesFromDisk(atPaths: [URL]) throws -> [InstanceCategory] {
    
    var finalObject: [InstanceCategory] = []
    
    for path in atPaths {
        
        print("In function: Path: \(path)")
        
        if let data: Data = FileManager.default.contents(atPath: path.path) {
            
            print("In function: Data: \(data)")
            
            if let decodedData = Data(base64Encoded: data) {
                let decoder = JSONDecoder()
                
                do {
                    
                    let decodedCategory = try decoder.decode(InstanceCategory.self, from: decodedData)
                    
                    finalObject.append(decodedCategory)
                    
                } catch {
                    throw DecodingError.failedToCreateObject
                }
            } else {
                throw DecodingError.failedtoDecodeFromBase64
            }
        } else {
            throw DecodingError.failedToReadFile
        }
    }
    
    return finalObject
    
}
