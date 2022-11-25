//
//  Instance Category.swift
//  MCStart
//
//  Created by David Bureš on 25.11.2022.
//

import Foundation

struct InstanceCategory: Identifiable, Codable {
    var id: UUID = UUID()
    
    let name: String
    
    let iconSymbolName: String
    
    var instances: [Instance]
}

class InstanceCategories: ObservableObject {
    @Published var categories: [InstanceCategory] = [
        InstanceCategory(name: "Vanilla", iconSymbolName: "folder", instances: [
            Instance(name: "Server", version: 196810, dateCreated: Date(), iconSymbolName: "rectangle.portrait.and.arrow.forward", settings: InstanceSettings(minMemory: 100, maxMemory: 5000)),
            Instance(name: "1.19", version: 145789, dateCreated: Date(), iconSymbolName: "pencil.circle", settings: InstanceSettings(minMemory: 427, maxMemory: 2034)),
            Instance(name: "1.18", version: 187568, dateCreated: Date(), iconSymbolName: "trash.slash", settings: InstanceSettings(minMemory: 2489, maxMemory: 203477))
        ]),
        InstanceCategory(name: "Modded", iconSymbolName: "internaldrive", instances: [
            Instance(name: "Better MC", version: 157486, dateCreated: Date(), iconSymbolName: "list.bullet.rectangle.portrait", settings: InstanceSettings(minMemory: 71244, maxMemory: 120004)),
            Instance(name: "Valhesia", version: 142758, dateCreated: Date(), iconSymbolName: "arrowshape.turn.up.left.2.circle", settings: InstanceSettings(minMemory: 20, maxMemory: 1277)),
            Instance(name: "KamienokX", version: 247586, dateCreated: Date(), iconSymbolName: "doc.text.image", settings: InstanceSettings(minMemory: 100, maxMemory: 5000)),
            Instance(name: "Permafrost - Eyes of the Storm", version: 245781, dateCreated: Date(), iconSymbolName: "person.badge.shield.checkmark.fill", settings: InstanceSettings(minMemory: 142, maxMemory: 5245)),
            Instance(name: "Ars Technica", version: 145724, dateCreated: Date(), iconSymbolName: "baseball.fill", settings: InstanceSettings(minMemory: 100, maxMemory: 5000)),
        ])
    ]
}
