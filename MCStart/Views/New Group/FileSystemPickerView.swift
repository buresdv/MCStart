//
//  FileSystemPickerView.swift
//  MCStart
//
//  Created by David Bureš on 17.12.2022.
//

import SwiftUI

struct FileSystemPickerView: View
{
    @State var label: String
    @State var pickerButtonLabel: String

    @Binding var selectedPath: String

    var body: some View
    {
        HStack
        {
            TextField(label, text: $selectedPath)

            AdjustableLabelButton
            {
                Label(pickerButtonLabel, systemImage: "magnifyingglass")
            } action: {
                do
                {
                    var newPath = try selectFile(canChooseFiles: false, canChooseDirectories: true, canChooseMultipleFiles: false, title: "Select Java Installation")

                    selectedPath = newPath.path
                }
                catch let error as NSError
                {
                    print(error)
                }
            }
        }
    }
}
