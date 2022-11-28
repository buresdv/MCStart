//
//  UISettingsPane.swift
//  MCStart
//
//  Created by David Bureš on 28.11.2022.
//

import SwiftUI

enum ButtonStyle: Identifiable {
    
    case textOnly
    case textAndIcon
    
    var id: Self { self }
}

struct UISettingsPane: View {
    
    #warning("Make this actually work")
    
    @State var buttonStyleSelection: ButtonStyle = .textOnly
    
    var body: some View {
        SettingsPaneTemplate {
            VStack {
                Form {
                    Picker(selection: $buttonStyleSelection) {
                        Text("Text Only").tag(ButtonStyle.textOnly)
                        Text("Text and Icon").tag(ButtonStyle.textAndIcon)
                    } label: {
                        Text("Button Style:")
                    }
                    .pickerStyle(.inline)
                }
            }
        }
    }
}
