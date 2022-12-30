//
//  AccountSettingsPage.swift
//  MCStart
//
//  Created by David Bureš on 17.12.2022.
//

import SwiftUI

struct AccountSettingsPage: View {
    
    @State var demoAccounts: [MicrosoftAccount] = [
        MicrosoftAccount(username: "lFenix"),
        MicrosoftAccount(username: "ballsdeep69"),
        MicrosoftAccount(username: "DamnBro")
    ]
    
    var body: some View {
        SettingsPaneTemplate {
            VStack {
                List(demoAccounts) { account in
                    
                    HStack {
                        Text(account.username)
                        
                        Spacer()
                        
                        Button {
                            print(account.username)
                            
                            withAnimation {
                                demoAccounts = demoAccounts.filter({ $0.id != account.id })
                            }
                            
                            
                        } label: {
                            Text("Remove")
                        }

                    }
                    
                }
                .listStyle(.bordered(alternatesRowBackgrounds: true))
                
                HStack {
                    Spacer()
                    
                    Button {
                        print("Hello")
                    } label: {
                        Label("Add Account", systemImage: "plus")
                            .labelStyle(.titleOnly)
                    }
                    .keyboardShortcut(.defaultAction)
                }

            }
        }
    }
}
