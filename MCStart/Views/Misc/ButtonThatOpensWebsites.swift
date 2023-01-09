//
//  ButtonThatOpensWebsites.swift
//  MCStart
//
//  Created by David Bureš on 31.12.2022.
//

import Foundation
import SwiftUI
import AppKit

struct ButtonThatOpensWebsites: View {
    
    @State var websiteURL: URL
    @State var buttonText: String
    
    var body: some View {
        Button {
            NSWorkspace.shared.open(websiteURL)
        } label: {
            HStack(alignment: .center) {
                Text(buttonText)
                Image(systemName: "safari")
            }
        }

    }
}
