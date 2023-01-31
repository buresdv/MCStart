//
//  Copy to Clipboard.swift
//  MCStart
//
//  Created by David Bureš on 27.11.2022.
//

import AppKit
import Foundation

func copyToClipboard(textToCopy: String)
{
    let pasteboard = NSPasteboard.general
    pasteboard.declareTypes([.string], owner: nil)
    pasteboard.setString(textToCopy, forType: .string)
}
