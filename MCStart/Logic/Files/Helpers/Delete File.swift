//
//  Delete File.swift
//  MCStart
//
//  Created by David Bureš on 26.12.2022.
//

import Foundation

func deleteFile(at url: URL) -> Void {
    do {
        try FileManager.default.removeItem(at: url)
    } catch let error as NSError {
        print("Failed while deleting file: \(error)")
    }
}
