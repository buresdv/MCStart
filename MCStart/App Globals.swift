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
    static let clientID: String = "a67bfa28-b653-4a37-a510-648584b1d920"
    static let redirectURL: String = "msauth.com.davidbures.MCStart://auth"
    static let kAuthority: String = "https://login.microsoftonline.com/consumers"
    static let graphEndpoint: String = "https://graph.microsoft.com/"
    
}
