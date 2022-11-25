//
//  Instance Settings.swift
//  MCStart
//
//  Created by David Bureš on 25.11.2022.
//

import Foundation

struct InstanceSettings: Identifiable, Codable {
    var id: UUID = UUID()
    
    let minMemory: Int?
    let maxMemory: Int?
    
}
