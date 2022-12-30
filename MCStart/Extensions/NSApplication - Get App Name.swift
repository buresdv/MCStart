//
//  NSApplication - Get App Name.swift
//  MCStart
//
//  Created by David Bureš on 30.12.2022.
//

import Foundation
import AppKit

extension NSApplication {
    static var appName: String? {
        return Bundle.main.object(forInfoDictionaryKey: "CFBundleName") as? String
    }
}
