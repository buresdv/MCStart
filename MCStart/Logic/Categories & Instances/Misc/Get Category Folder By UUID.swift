//
//  Get Instance folder By UUID.swift
//  MCStart
//
//  Created by David Bureš on 05.12.2022.
//

import Foundation

func getPathToCategoryFolderByUUID(categoryUUID: UUID) -> URL {
    return AppGlobals.categoriesDirectoryPath.appendingPathComponent(categoryUUID.uuidString, conformingTo: .directory)
}
