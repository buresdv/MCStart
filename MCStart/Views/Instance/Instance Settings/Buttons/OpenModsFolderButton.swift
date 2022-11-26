//
//  OpenModsFolderButton.swift
//  MCStart
//
//  Created by David Bureš on 26.11.2022.
//

import SwiftUI

struct OpenModsFolderButton: View {
    
    @State var modsFolder: String
    
    var body: some View {
        Button {
            openFinder(at: URL(string: modsFolder)!)
        } label: {
            Label("Open Mods Folder", systemImage: "checklist")
        }
    }
}

