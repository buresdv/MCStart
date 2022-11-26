//
//  ExportArgumentSheet.swift
//  MCStart
//
//  Created by David Bureš on 27.11.2022.
//

import SwiftUI

struct ExportArgumentSheet: View {
    
    @Binding var isShowingSheet: Bool
    
    @State var currentActiveArguments: [String]
    @State private var currentActiveArgumentsJoined: String = ""
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Copy the arguments")
            NicerTextEditor(text: $currentActiveArgumentsJoined)
                .onAppear {
                    currentActiveArgumentsJoined = currentActiveArguments.joined(separator: " -")
                    currentActiveArgumentsJoined = "-\(currentActiveArgumentsJoined)"
                }
            
            Spacer()
            
            HStack {
                Button {
                    copyToClipboard(textToCopy: currentActiveArgumentsJoined)
                } label: {
                    Label("Copy", systemImage: "doc.on.doc")
                }
                
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
