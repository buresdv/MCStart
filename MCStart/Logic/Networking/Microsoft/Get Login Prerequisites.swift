//
//  Get Login Prerequisites.swift
//  MCStart
//
//  Created by David Bureš on 26.11.2022.
//

import Foundation

// Gets login prerequisites from Microsoft.
// Returns an array where: [sFFTag, urlPost]
func getLoginPrerequisites() async -> [String] {
    var returnedBlobs: [String] = []
    
    do {
        let microsoftLoginBlob: String = try await NetworkingManager().sendRequest(endpointURL: "https://login.live.com/oauth20_authorize.srf?client_id=000000004C12AE6F&redirect_uri=https://login.live.com/oauth20_desktop.srf&scope=service::user.auth.xboxlive.com::MBI_SSL&display=touch&response_type=token&locale=en", httpMethod: .none, headers: nil, requestBody: nil)
        
        let sFFTag: String = extractTextFromStringUsingREGEX(for: "value=\"(.+?)\"", in: microsoftLoginBlob).first!
        let urlPost: String = extractTextFromStringUsingREGEX(for: "urlPost:'(.+?)'", in: microsoftLoginBlob).first!
        
        returnedBlobs.append(sFFTag)
        returnedBlobs.append(urlPost)
    } catch let error as NSError {
        print("Error while getting Microsoft login blob: \(error)")
    }
    
    return returnedBlobs
}
