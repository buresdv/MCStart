//
//  OpenModsFolderButton.swift
//  MCStart
//
//  Created by David Bureš on 26.11.2022.
//

import SwiftUI

struct OpenModsFolderButton: View
{
    @State var modsFolder: URL

    var body: some View
    {
        Button
        {
            openFinder(at: modsFolder)
        } label: {
            Label("Open Mods Folder", systemImage: "checklist")
        }
    }
}
