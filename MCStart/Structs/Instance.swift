//
//  Instance.swift
//  MCStart
//
//  Created by David Bureš on 25.11.2022.
//

import Foundation

struct Instance: Identifiable, Codable {
    
    var id: UUID = UUID()
    
    var name: String
    let version: String
    
    let dateCreated: Date
    
    let iconSymbolName: String
    
    var mods: [Mod]

    var settings: InstanceSettings
    
    func convertDateToPresentableFormat(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm E, d MMM y"
        
        return dateFormatter.string(from: date)
    }
}
