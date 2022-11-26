//
//  OpenModsFolderButton.swift
//  MCStart
//
//  Created by David Bureš on 26.11.2022.
//

import SwiftUI

struct OpenModsFolderButton: View {
    var body: some View {
        Button {
            print("Would open mods folder")
        } label: {
            Label("Open Mods Folder", systemImage: "checklist")
        }
    }
}

