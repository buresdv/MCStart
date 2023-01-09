//
//  Decode From File.swift
//  MCStart
//
//  Created by David Bureš on 03.12.2022.
//

import Foundation

enum DecodingError: Error {
    case failedToAccessCategoriesFolder
    case failedToAccessInstancesFolder
    case failedToAccessInstanceMetadata
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

func decodeInstancesFromDisk(atCategoryPath: URL) throws -> [Instance] {
    var finalInstances: [Instance] = []
    
    do {
        let instanceFoldersInCategoryFolder: [URL] = try getContentsOfFolder(at: atCategoryPath, returns: .folders)
        
        for instanceFolder in instanceFoldersInCategoryFolder {
            do {
                let instanceMetadataFileLocation: URL = try getPathToMetadataFile(in: instanceFolder, checkIfMetadataFileAlreadyExists: true)
                
                if let data: Data = FileManager.default.contents(atPath: instanceMetadataFileLocation.path) {
                    if let decodedData = Data(base64Encoded: data) {
                        let decoder = JSONDecoder()
                        
                        do {
                            let decodedInstance = try decoder.decode(Instance.self, from: decodedData)
                            
                            finalInstances.append(decodedInstance)
                        } catch let error as NSError {
                            print("Failed to create Instance objects from data: \(error)")
                            throw DecodingError.failedToCreateObject
                        }
                        
                    } else {
                        throw DecodingError.failedtoDecodeFromBase64
                    }
                } else {
                    throw DecodingError.failedToReadFile
                }
                
            } catch let error as NSError {
                print("Failed to access Instance metadata file: \(error)")
                throw DecodingError.failedToAccessInstanceMetadata
            }
        }
    } catch let error as NSError {
        print("Failed to access Instances folder: \(error)")
        throw DecodingError.failedToAccessInstancesFolder
    }
    
    return finalInstances
}
