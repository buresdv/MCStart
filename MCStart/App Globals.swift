//
//  App Globals.swift
//  MCStart
//
//  Created by David Bureš on 26.11.2022.
//

import Foundation

struct AppGlobals {
    static let applicationSupportDirectoryPath: URL = FileManager.default.urls(for: .applicationSupportDirectory, in: .userDomainMask).first!
    
    static let categoriesDirectoryPath: URL = AppGlobals.applicationSupportDirectoryPath.appendingPathComponent("Categories", conformingTo: .directory)
}
