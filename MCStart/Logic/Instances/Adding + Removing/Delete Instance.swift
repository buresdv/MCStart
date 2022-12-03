//
//  Delete Instance.swift
//  MCStart
//
//  Created by David Bureš on 02.12.2022.
//

import Foundation

func deleteInstance(instanceUUID: UUID, instanceTracker: inout [Instance]) -> Void {
    instanceTracker.removeAll(where: { $0.id == instanceUUID })
}
