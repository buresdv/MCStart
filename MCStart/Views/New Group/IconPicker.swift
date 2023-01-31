//
//  IconSelector.swift
//  MCStart
//
//  Created by David Bureš on 28.11.2022.
//

import SwiftUI
import SymbolPicker

struct IconPicker: View
{
    @Binding var selectedSymbolName: String

    @State private var isShowingSymbolPicker: Bool = false

    var body: some View
    {
        Button
        {
            print("Tapped")
            isShowingSymbolPicker.toggle()
        } label: {
            Label("Pick Icon", systemImage: selectedSymbolName)
                .labelStyle(.iconOnly)
        }
        .popover(isPresented: $isShowingSymbolPicker)
        {
            SymbolPicker(symbol: $selectedSymbolName)
        }
    }
}
