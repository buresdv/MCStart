//
//  Delete Instance.swift
//  MCStart
//
//  Created by David Bureš on 02.12.2022.
//

import Foundation
import SwiftUI

enum DeletionError: Error
{
    case failedToDeleteFolder
}

func deleteInstance(parentCategoryUUID: UUID, instanceUUID: UUID, instanceTracker: inout [Instance]) throws
{
    instanceTracker.removeAll(where: { $0.id == instanceUUID })

    let parentCategoryPath: URL = getPathToCategoryFolderByUUID(categoryUUID: parentCategoryUUID)
    let instancePath: URL = parentCategoryPath.appendingPathComponent(instanceUUID.uuidString, conformingTo: .directory)

    do
    {
        try FileManager.default.removeItem(at: instancePath)
    }
    catch let error as NSError
    {
        print("Error while deleting instance from disk: \(error)")
        throw DeletionError.failedToDeleteFolder
    }
}
