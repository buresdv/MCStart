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
    static let clientID: String = "8d5edab1-8905-419f-bb68-270dd0df4a63"
    static let redirectURL: String = "msauth.com.davidbures.MCStart://auth"
    static let kAuthority: String = "https://login.microsoftonline.com/consumers"
    static let graphEndpoint: String = "https://graph.microsoft.com/"
    
}
