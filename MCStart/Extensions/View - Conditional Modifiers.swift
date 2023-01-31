//
//  View - Conditional Modifiers.swift
//  MCStart
//
//  Created by David Bureš on 26.11.2022.
//

import Foundation
import SwiftUI

extension View
{
    @ViewBuilder func `if`<Content: View>(_ condition: Bool, transform: (Self) -> Content) -> some View
    {
        if condition
        {
            transform(self)
        }
        else
        {
            self
        }
    }
}
