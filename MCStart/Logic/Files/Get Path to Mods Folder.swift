//
//  Get Path to Mods Folder.swift
//  MCStart
//
//  Created by David Bureš on 30.12.2022.
//

import Foundation

func getPathToModsFolder(categoryUUID: UUID, instanceUUID: UUID) -> URL
{
    return AppGlobals.categoriesDirectoryPath.appendingPathComponent(categoryUUID.uuidString, conformingTo: .folder).appendingPathComponent(instanceUUID.uuidString, conformingTo: .folder).appendingPathComponent("mods", conformingTo: .folder)
}
