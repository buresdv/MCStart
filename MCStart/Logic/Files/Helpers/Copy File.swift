//
//  Copy File.swift
//  MCStart
//
//  Created by David Bureš on 26.12.2022.
//

import Foundation

func copyFile(from originalPath: URL, to targetPath: URL) -> Void {
    
    let fileName: String = originalPath.lastPathComponent
    
    do {
        try FileManager.default.copyItem(at: originalPath, to: targetPath.appendingPathComponent(fileName, conformingTo: .archive))
    } catch let error as NSError {
        print("Failed while copying file: \(error)")
    }
    
    print(fileName)
    
}
