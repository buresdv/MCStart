//
//  App Globals.swift
//  MCStart
//
//  Created by David Bureš on 26.11.2022.
//

import Foundation

struct AppGlobals {
    static let applicationSupportDirectoryPath: URL = FileManager.default.urls(for: .applicationSupportDirectory, in: .userDomainMask).first!.appendingPathComponent("MCStart", conformingTo: .directory)
    
    static let categoriesDirectoryPath: URL = AppGlobals.applicationSupportDirectoryPath.appendingPathComponent("Categories", conformingTo: .directory)
    
    /// Microsoft authentication requirements
    static let clientID: String = "689b6f28-1618-4f20-a992-f1853bef62d0"
    static let redirectURL: String = "msauth.com.davidbures.MCStart://auth"
    static let kAuthority: String = "https://login.microsoftonline.com/common"
    static let graphEndpoint: String = "https://graph.microsoft.com/"
    
}
