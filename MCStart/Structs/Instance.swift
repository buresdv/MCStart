//
//  Instance.swift
//  MCStart
//
//  Created by David Bureš on 25.11.2022.
//

import Foundation

enum ModLoaders: String, Codable {
    case vanilla = "Vanilla"
    case fabric = "Fabric"
    case forge = "Forge"
}

struct Instance: Identifiable, Codable {
    
    var id: UUID = UUID()
    
    var name: String
    var version: String
    
    let dateCreated: Date
    
    var iconSymbolName: String
    
    var modLoader: ModLoaders
    
    var mods: [Mod]

    var settings: InstanceSettings
    
    func convertDateToPresentableFormat(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm E, d MMM y"
        
        return dateFormatter.string(from: date)
    }
}
