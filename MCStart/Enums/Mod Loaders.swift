//
//  Mod Loaders.swift
//  MCStart
//
//  Created by David Bureš on 06.12.2022.
//

import Foundation

enum ModLoaders: String, Codable, Hashable, CaseIterable
{
    case vanilla = "Vanilla"
    case fabric = "Fabric"
    case forge = "Forge"
}
