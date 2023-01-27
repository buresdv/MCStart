//
//  CloseSheetButton.swift
//  MCStart
//
//  Created by David Bureš on 27.11.2022.
//

import SwiftUI

struct CloseSheetButton: View {
    
    @Binding var isShowingSheet: Bool
    
    @State var customButtonText: String?
    
    var body: some View {
        AdjustableLabelButton {
            Label(customButtonText ?? "Close", systemImage: "xmark")
        } action: {
            isShowingSheet.toggle()
        }
        .keyboardShortcut(.cancelAction)
        
    }
}
