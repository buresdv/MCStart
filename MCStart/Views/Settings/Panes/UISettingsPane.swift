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
    
    @AppStorage("accentColor") var accentColor: Color = .black
    @AppStorage("accentColorAlsoAppliesToCategoryList") var accentColorAlsoAppliesToCategoryList: Bool = false
    
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
                    
                    ColorPicker(selection: $accentColor) {
                        Text("Accent Color:")
                    }
                    Picker(selection: $accentColorAlsoAppliesToCategoryList) {
                        Text("Instances Only").tag(false)
                        Text("Instances and Categories").tag(true)
                    } label: {
                        Text("Accent Color Applies To:")
                    }
                    .pickerStyle(.menu)
                }
            }
            .frame(minWidth: 350)
        }
    }
}
