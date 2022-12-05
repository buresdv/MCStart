//
//  Load Up Item Data.swift
//  MCStart
//
//  Created by David Bureš on 28.11.2022.
//

import Foundation

func loadUpCategoryOrInstanceMetadata(at path: String) -> Data {
    
    var metadata: Data = Data()
    
    let pathToInstanceOrCategoryAsURL: URL = URL(string: path)!
    
    let pathToMetadataFile = pathToInstanceOrCategoryAsURL.appendingPathComponent("Metadata", conformingTo: .data)
    
    do {
        metadata = try Data(contentsOf: pathToMetadataFile, options: .mappedIfSafe)
    } catch let error as NSError {
        fatalError("Critical Failure while attempting to load metadata: \(error)")
    }
    
    return metadata
}
