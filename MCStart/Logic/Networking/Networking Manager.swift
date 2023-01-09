//
//  Networking Manager.swift
//  MCStart
//
//  Created by David Bureš on 26.11.2022.
//

import Foundation
import SwiftUI

final class NetworkingManager {    
    func sendRequest(endpointURL: String, httpMethod: HTTPMethods, headers: [HTTPHeader]?, requestBody: String?) async throws -> String
    {
        guard let url = URL(string: endpointURL) else
        {
            throw NetworkingError.failedToEncoreURL
        }
        
        var urlRequest = URLRequest(url: url)
        
        switch httpMethod
        {
        case .post:
            urlRequest.httpMethod = "POST"
        case .get:
            urlRequest.httpMethod = "GET"
        case .none:
            break
        }
        
        if let headers
        {
            for header in headers
            {
                urlRequest.addValue(header.fieldContents, forHTTPHeaderField: header.headerField)
            }
        }
        
        if let requestBody
        {
            urlRequest.httpBody = requestBody.data(using: .utf8, allowLossyConversion: false)
            
            //debugPrint(String(decoding: urlRequest.httpBody!, as: UTF8.self))
        }
        
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        
        //debugPrint((response as? HTTPURLResponse)?.statusCode)
        
        guard (response as? HTTPURLResponse)?.statusCode == 200 else
        {
            throw NetworkingError.receivedBadResponseCode
        }
        
        let dataDecoded: String = String(bytes: data, encoding: .utf8)!
        
        return dataDecoded
    }

}
