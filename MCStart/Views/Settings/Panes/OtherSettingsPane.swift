//
//  OtherSettingsPane.swift
//  MCStart
//
//  Created by David Bureš on 17.12.2022.
//

import SwiftUI

struct OtherSettingsPane: View
{
    @AppStorage("showOnboarding") var showOnboarding: Bool = false

    var body: some View
    {
        SettingsPaneTemplate
        {
            VStack
            {
                Toggle(isOn: $showOnboarding)
                {
                    Text("Show Onboarding Sheet")
                }
                Text("this is another super long text just so I can switch the damn tab")
            }
        }
    }
}
