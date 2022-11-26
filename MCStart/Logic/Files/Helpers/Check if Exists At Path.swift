//
//  Check if Exists At Path.swift
//  MCStart
//
//  Created by David Bureš on 26.11.2022.
//

import Foundation

func existsAtPath(atPath path: String) -> Bool {
    if FileManager.default.fileExists(atPath: path) {
        return true
    } else {
        return false
    }
}
