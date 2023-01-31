//
//  Open Finder.swift
//  MCStart
//
//  Created by David Bureš on 25.11.2022.
//

import AppKit
import Foundation

func openFinder(at path: URL)
{
    NSWorkspace.shared.selectFile(nil, inFileViewerRootedAtPath: path.path)
}
