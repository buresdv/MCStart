//
//  Microsoft Account.swift
//  MCStart
//
//  Created by David Bureš on 30.12.2022.
//

import Foundation

struct MicrosoftAccount: Codable, Identifiable {
    var id: UUID = UUID()
    
    let username: String
}
