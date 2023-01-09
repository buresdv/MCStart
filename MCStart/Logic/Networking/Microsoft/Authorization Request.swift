//
//  Authorization Request.swift
//  MCStart
//
//  Created by David Bureš on 30.12.2022.
//

import Foundation
import AppKit

func requestMicrosoftAuthorization() async -> String {
    
    var response: String = ""
    
    do {
        response = try await NetworkingManager().sendRequest(endpointURL: "https://login.microsoftonline.com/consumers/oauth2/v2.0/authorize?client_id=\(AppGlobals.clientID)&response_type=code&redirect_uri=\(AppGlobals.redirectURL)&response_mode=query&scope=offline_access%20user.read%20mail.read", httpMethod: .none, headers: nil, requestBody: nil)
        
    } catch let error as NSError {
        print("Error while retrieving Microsoft Authorization: \(error)")
    }
    
    return response
}
