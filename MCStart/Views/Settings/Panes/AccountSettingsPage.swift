//
//  AccountSettingsPage.swift
//  MCStart
//
//  Created by David Bureš on 17.12.2022.
//

import SwiftUI

struct AccountSettingsPage: View {
    
    @State var demoAccount: MicrosoftAccount = MicrosoftAccount(username: "lFenix")
    
    var body: some View {
        SettingsPaneTemplate {
            VStack {
                VStack(alignment: .center) {
                    AsyncImage(url: URL(string: "https://crafatar.com/avatars/69dddb94-8ce5-405e-b8bb-29f237cc658e")) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 100, height: 100, alignment: .center)
                    } placeholder: {
                        ProgressView()
                    }

                    Text(demoAccount.username)
                        .font(.headline)
                }
                
                HStack {
                    Spacer()                    

                    AdjustableLabelButton {
                        Label("Add Account", systemImage: "plus")
                    } action: {
                        print("Hello")
                    }
                    .keyboardShortcut(.defaultAction)
                    
                }

            }
        }
    }
}
