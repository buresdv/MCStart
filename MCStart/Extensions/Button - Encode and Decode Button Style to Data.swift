//
//  Button - Encode and Decode Button Style to Data.swift
//  MCStart
//
//  Created by David Bureš on 17.12.2022.
//

import Foundation
import SwiftUI

extension ButtonStyle: RawRepresentable
{
    public init?(rawValue: String)
    {
        guard let data = Data(base64Encoded: rawValue)
        else
        {
            self = .textOnly
            return
        }

        do
        {
            let selectedButtonStyle = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data) as? ButtonStyle ?? .textOnly
            self = selectedButtonStyle as ButtonStyle
        }
        catch
        {
            self = .textOnly
        }
    }

    public var rawValue: String
    {
        do
        {
            let data = try NSKeyedArchiver.archivedData(withRootObject: ButtonStyle.self, requiringSecureCoding: false) as Data
            return data.base64EncodedString()
        }
        catch
        {
            return ""
        }
    }
}
