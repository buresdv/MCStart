//
//  SettingsView.swift
//  MCStart
//
//  Created by David Bureš on 25.11.2022.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        TabView {
            UISettingsPane()
                .tabItem {
                    Label("UI Settings", systemImage: "macwindow")
                }
            AccountSettingsPage()
                .tabItem {
                    Label("Accounts", systemImage: "person.crop.circle")
                }
            OtherSettingsPane()
                .tabItem {
                    Label("Other", systemImage: "gearshape")
                }
        }
        .presentedWindowToolbarStyle(.unified(showsTitle: false))
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
