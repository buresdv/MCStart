//
//  Instance Category.swift
//  MCStart
//
//  Created by David Bureš on 25.11.2022.
//

import Foundation

struct InstanceCategory: Identifiable, Codable {
    var id: UUID = UUID()
    
    var name: String
    
    var iconSymbolName: String
    
    var instances: [Instance]
    
}

class InstanceCategories: ObservableObject {
    /*@Published var categories: [InstanceCategory] = [
        InstanceCategory(name: "Vanilla", iconSymbolName: "folder", instances: [
            Instance(name: "Server", version: "1.20", dateCreated: Date(), iconSymbolName: "rectangle.portrait.and.arrow.forward", modLoader: .vanilla, mods: [], settings: InstanceSettings(javaExecutablePath: "/Users/david/Downloads", javaArguments: [], minMemory: 100, maxMemory: 5000)),
            Instance(name: "1.19", version: "1.19.3", dateCreated: Date(), iconSymbolName: "pencil.circle", modLoader: .vanilla, mods: [], settings: InstanceSettings(javaExecutablePath: "/Applications", javaArguments: [
                "XX:+DisableExplicitGC",
                "XX:+UseConcMarkSweepGC"
            ], minMemory: 427, maxMemory: 2034)),
            Instance(name: "1.18", version: "1.18.2", dateCreated: Date(), iconSymbolName: "trash.slash", modLoader: .vanilla, mods: [], settings: InstanceSettings(javaExecutablePath: "/Users/david/Documents", javaArguments: [
                "XX:+AggressiveOpts",
                "XX:+DisableExplicitGC",
                "XX:+PerfDisableSharedMem",
                "XX:MaxGCPauseMillis=200"
            ], minMemory: 2489, maxMemory: 203477))
        ]),
        InstanceCategory(name: "Modded", iconSymbolName: "internaldrive", instances: [
            Instance(name: "Better MC", version: "1.17", dateCreated: Date(), iconSymbolName: "list.bullet.rectangle.portrait", modLoader: .fabric, mods: [
                Mod(name: "Some cool mod", version: "1.2", isEnabled: true),
                Mod(name: "Another interesting item", version: "1.4", isEnabled: true),
                Mod(name: "Very Cool", version: "10.1.45", isEnabled: false)
            ], settings: InstanceSettings(javaExecutablePath: "/Users/david/Desktop", javaArguments: [
                "XX:ConcGCThreads=2",
                "XX:+UseG1GC"
            ], minMemory: 71244, maxMemory: 120004)),
            Instance(name: "Valhesia", version: "1.18.2", dateCreated: Date(), iconSymbolName: "arrowshape.turn.up.left.2.circle", modLoader: .fabric, mods: [
                Mod(name: "Applied Energetics", version: "1.5", isEnabled: true)
            ], settings: InstanceSettings(javaExecutablePath: "/Users/david/Documents/Psaní", javaArguments: [
                "XX:InitiatingHeapOccupancyPercent=50",
                "XX:G1HeapRegionSize=1",
                "XX:G1HeapWastePercent=5",
                "XX:G1MixedGCCountTarget=8"
            ], minMemory: 20, maxMemory: 1277)),
            Instance(name: "KamienokX", version: "1.19.3", dateCreated: Date(), iconSymbolName: "doc.text.image", modLoader: .fabric, mods: [
                Mod(name: "IndustrialCraft 2", version: "4.57", isEnabled: false)
            ], settings: InstanceSettings(javaExecutablePath: "/Users/david/Documents/Psaní/Scrivener záloha", javaArguments: [
                "XX:+AggressiveOpts",
                "XX:+DisableExplicitGC",
                "XX:+PerfDisableSharedMem",
                "XX:MaxGCPauseMillis=200"
            ], minMemory: 100, maxMemory: 5000)),
            Instance(name: "Permafrost - Eyes of the Storm", version: "1.15.2", dateCreated: Date(), iconSymbolName: "person.badge.shield.checkmark.fill", modLoader: .forge, mods: [
                Mod(name: "Presence Footsteps", version: "2.4", isEnabled: true),
                Mod(name: "Atmospherica", version: "4.7", isEnabled: true),
                Mod(name: "TerraFirmaCraft", version: "10.1.48", isEnabled: true),
                Mod(name: "Stromy Nights", version: "6.9", isEnabled: true)
            ], settings: InstanceSettings(javaExecutablePath: "/Users/david/Applications (Parallels)", javaArguments: [
                "XX:+AggressiveOpts",
                "XX:+DisableExplicitGC",
                "XX:+PerfDisableSharedMem",
                "XX:MaxGCPauseMillis=200"
            ], minMemory: 142, maxMemory: 5245)),
            Instance(name: "Ars Technica", version: "1.19.3", dateCreated: Date(), iconSymbolName: "baseball.fill", modLoader: .forge, mods: [
                Mod(name: "Ex Nihilo", version: "7.4", isEnabled: false)
            ], settings: InstanceSettings(javaExecutablePath: "", javaArguments: [
                "XX:InitiatingHeapOccupancyPercent=50",
                "XX:G1HeapRegionSize=1",
                "XX:G1HeapWastePercent=5",
                "XX:G1MixedGCCountTarget=8"
            ], minMemory: 100, maxMemory: 5000)),
        ])
    ]*/
    @Published var categories: [InstanceCategory] = []
}
