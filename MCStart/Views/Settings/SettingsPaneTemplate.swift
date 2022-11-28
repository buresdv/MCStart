//
//  SettingsPaneTemplate.swift
//  MCStart
//
//  Created by David Bureš on 28.11.2022.
//

import SwiftUI

struct SettingsPaneTemplate<Content: View>: View {
    
    // Pass whatever gets panned into this view into the variable "paneContent"
    @ViewBuilder var paneContent: Content
    
    var body: some View {
        paneContent
            .padding()
    }
}
