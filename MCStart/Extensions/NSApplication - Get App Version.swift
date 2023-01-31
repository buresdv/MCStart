//
//  NSApplication - Get App Version.swift
//  MCStart
//
//  Created by David Bureš on 30.12.2022.
//

import AppKit
import Foundation

extension NSApplication
{
    static var appVersion: String?
    {
        return Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String
    }

    static var buildVersion: String?
    {
        return Bundle.main.object(forInfoDictionaryKey: "CFBundleVersion") as? String
    }
}
