//
//  Instance.swift
//  MCStart
//
//  Created by David Bureš on 25.11.2022.
//

import Foundation

struct Instance: Identifiable, Codable
{
    var id: UUID = .init()

    var name: String
    var version: String

    let dateCreated: Date

    var iconSymbolName: String

    var modLoader: ModLoaders

    var mods: [Mod]

    var settings: InstanceSettings

    func convertDateToPresentableFormat(date: Date) -> String
    {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm E, d MMM y"

        return dateFormatter.string(from: date)
    }
}
