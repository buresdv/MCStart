//
//  Mods.swift
//  MCStart
//
//  Created by David Bureš on 25.11.2022.
//

import Foundation

struct Mod: Codable, Identifiable {
    var id: UUID = UUID()
    
    let name: String
    let version: String
    
    let path: URL
    
    var isEnabled: Bool
}
