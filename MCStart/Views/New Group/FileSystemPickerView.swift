//
//  FileSystemPickerView.swift
//  MCStart
//
//  Created by David Bureš on 17.12.2022.
//

import SwiftUI

struct FileSystemPickerView: View {
    
    @State var label: String
    @State var textFieldPlaceholder: String
    
    @Binding var selectedPath: String
    
    var body: some View {
        HStack {
            TextField(textFieldPlaceholder, text: $selectedPath)
            Button {
                do {
                    var newPath = try selectFile(canChooseFiles: false, canChooseDirectories: true, title: "Select Java Installation")
                    
                    selectedPath = newPath.path
                    
                } catch let error as NSError {
                    print(error)
                }
            } label: {
                Label(label, systemImage: "magnifyingglass")
                    .labelStyle(.iconOnly)
            }

        }
    }
}
