//
//  AdjustableLabelButton.swift
//  MCStart
//
//  Created by David Bureš on 27.01.2023.
//

import SwiftUI


struct AdjustableLabelButton<Content: View>: View
{
    
    @AppStorage("buttonStyle") var buttonStyle: UsableButtonStyles = .textOnly
    
    let label: () -> Content
    let action: () -> Void
    
    #warning("TODO: Switch these two so it follows the normal Button convention. For some fucking reason it doesn't work if it's switched")
    
    var body: some View
    {
        Button {
            action()
        } label: {
            label()
                .if(buttonStyle == .textOnly) { view in
                    view.labelStyle(.titleOnly)
                }
                .if(buttonStyle == .textAndIcon) { view in
                    view.labelStyle(.titleAndIcon)
                }
        }
    }
}
