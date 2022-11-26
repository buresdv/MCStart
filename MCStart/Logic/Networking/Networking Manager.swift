//
//  Networking Manager.swift
//  MCStart
//
//  Created by David Bureš on 26.11.2022.
//

import Foundation

class NetworkingManager {
    func sendRequest(endpointURL: String) async throws -> String {
        guard let url = URL(string: endpointURL) else {
            return String("FAILURE")
        }
        
        let urlRequest = URLRequest(url: url)
        
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            return String("FAILURE")
        }
        
        let dataDecoded: String = String(bytes: data, encoding: .utf8)!
        
        return dataDecoded
    }
}
