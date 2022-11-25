//
//  Mods.swift
//  MCStart
//
//  Created by David Bureš on 25.11.2022.
//

import Foundation

struct Mod: Codable {
    let name: String
    let version: String
    
    let isEnabled: Bool
}
