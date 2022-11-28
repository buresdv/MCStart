//
//  nicerTextEditor.swift
//  MCStart
//
//  Created by David Bureš on 26.11.2022.
//

import SwiftUI

struct NicerTextEditor: View {
    
    @Binding var text: String
    
    var body: some View {
        TextEditor(text: $text)
            .font(.body)
            .background(Color.white)
            .padding(5)
            .border(.secondary)
    }
}
