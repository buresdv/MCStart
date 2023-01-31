//
//  Color - Encode and Decode into Data.swift
//  MCStart
//
//  Created by David Bureš on 17.12.2022.
//

import Foundation
import SwiftUI

extension Color: RawRepresentable
{
    public init?(rawValue: String)
    {
        guard let data = Data(base64Encoded: rawValue)
        else
        {
            self = .black
            return
        }

        do
        {
            let color = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data) as? NSColor ?? .black
            self = Color(color)
        }
        catch
        {
            self = .black
        }
    }

    public var rawValue: String
    {
        do
        {
            let data = try NSKeyedArchiver.archivedData(withRootObject: NSColor(self), requiringSecureCoding: false) as Data
            return data.base64EncodedString()
        }
        catch
        {
            return ""
        }
    }
}
