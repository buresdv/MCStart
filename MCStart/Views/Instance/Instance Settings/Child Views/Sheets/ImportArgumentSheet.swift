//
//  ImportArgumentSheet.swift
//  MCStart
//
//  Created by David Bureš on 27.11.2022.
//

import SwiftUI

struct ImportArgumentSheet: View {
    
    @Binding var isShowingSheet: Bool
    
    @Binding var massInsertedArguments: String
    
    var body: some View {
        VStack(alignment: .leading) {
            
            #warning("Make this put the arguments into the list only when the user clicks a button")
            Text("Paste the arguments below")
            NicerTextEditor(text: $massInsertedArguments)
            
            HStack {
                Spacer()
                
                CloseSheetButton(isShowingSheet: $isShowingSheet)
            }
        }
        .padding()
        .frame(
            minWidth: 500,
            minHeight: 300
        )
    }
}
