//
//  Copy to Clipboard.swift
//  MCStart
//
//  Created by David Bureš on 27.11.2022.
//

import Foundation
import AppKit

func copyToClipboard(textToCopy: String) -> Void {
    let pasteboard = NSPasteboard.general
    pasteboard.declareTypes([.string], owner: nil)
    pasteboard.setString(textToCopy, forType: .string)
}
