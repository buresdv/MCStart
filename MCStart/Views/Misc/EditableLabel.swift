//
//  EditableTextField.swift
//  MCStart
//
//  Created by David Bureš on 25.11.2022.
//

import SwiftUI

public struct EditableLabel: View {
    @Binding var text: String
    @State private var newValue: String = ""
    
    @State var editProcessGoing = false { didSet{ newValue = text } }
    
    let onEditEnd: () -> Void
    
    public init(_ txt: Binding<String>, onEditEnd: @escaping () -> Void) {
        _text = txt
        self.onEditEnd = onEditEnd
    }
    
    @ViewBuilder
    public var body: some View {
        ZStack {
            // Text variation of View
            Text(text)
                .opacity(editProcessGoing ? 0 : 1)
                .padding(.leading, 0)
            
            // TextField for edit mode of View
            TextField("", text: $newValue,
                          onEditingChanged: { _ in },
                          onCommit: { text = newValue; editProcessGoing = false; onEditEnd() } )
                .opacity(editProcessGoing ? 1 : 0)
        }
        // Enable EditMode on double tap
        .onTapGesture(count: 1, perform: {
            withAnimation {
                editProcessGoing = true
            }
        })
        // Exit from EditMode on Esc key press
        .onExitCommand(perform: { editProcessGoing = false; newValue = text })
    }
}
