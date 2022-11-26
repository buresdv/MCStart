//
//  Open Finder.swift
//  MCStart
//
//  Created by David Bureš on 25.11.2022.
//

import Foundation
import AppKit

func openFinder(at path: URL) -> Void {
    NSWorkspace.shared.selectFile(nil, inFileViewerRootedAtPath: path.path)
}
