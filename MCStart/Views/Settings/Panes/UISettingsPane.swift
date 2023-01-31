//
//  UISettingsPane.swift
//  MCStart
//
//  Created by David Bureš on 28.11.2022.
//

import SwiftUI

enum ButtonStyle: Identifiable
{
    case textOnly
    case textAndIcon

    var id: Self { self }
}

struct UISettingsPane: View
{
    #warning("Make this actually work")

    @AppStorage("accentColor") var accentColor: Color = .black
    @AppStorage("accentColorAlsoAppliesToCategoryList") var accentColorAlsoAppliesToCategoryList: Bool = false
    @AppStorage("accentColorAlsoAppliesToActiveButtonState") var accentColorAlsoAppliesToActiveButtonState: Bool = false
    @AppStorage("buttonStyle") var buttonStyle: UsableButtonStyles = .textOnly

    var body: some View
    {
        SettingsPaneTemplate
        {
            VStack
            {
                Form
                {
                    Section
                    { // Button Styles
                        Picker(selection: $buttonStyle)
                        {
                            Text("Text Only").tag(UsableButtonStyles.textOnly)
                            Text("Text and Icon").tag(UsableButtonStyles.textAndIcon)
                        } label: {
                            Text("Button Style:")
                        }
                        .pickerStyle(.inline)
                    }

                    Section
                    { // Accent Colors
                        ColorPicker(selection: $accentColor)
                        {
                            Text("Accent Color:")
                        }
                        Picker(selection: $accentColorAlsoAppliesToCategoryList)
                        {
                            Text("Instances Only").tag(false)
                            Text("Instances and Categories").tag(true)
                        } label: {
                            Text("Accent Color Applies To:")
                        }
                        .pickerStyle(.inline)

                        LabeledContent
                        {
                            Toggle(isOn: $accentColorAlsoAppliesToActiveButtonState)
                            {
                                Text("Active Buttons")
                            }

                        } label: {
                            Text("")
                        }
                        .labelsHidden()
                    }
                }
            }
            .frame(minWidth: 350)
        }
    }
}
