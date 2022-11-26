//
//  InstanceSettingMinecraftOptions.swift
//  MCStart
//
//  Created by David Bureš on 26.11.2022.
//

import SwiftUI

struct InstanceSettingMinecraftOptions: View {
    
    var availableVersions: [String] = ["1.19.2", "1.19.1", "1.19", "1.18.2", "1.18.1"]
    @State var selectedVersion: String = ""
    
    @State private var isShowingPurgeAlert = false
    
    var body: some View {
        VStack {
            GroupBox {
                Grid(alignment: .leading) {
                    
                    GridRow {
                        Text("Minecraft Version")
                        Picker(selection: $selectedVersion) {
                            ForEach(availableVersions, id: \.self) { version in
                                Text(version)
                            }
                        } label: {
                            Text("")
                        }
                    }
                    
                    DividerMaintainingGridWidth()
                    
                    GridRow {
                        
                    }
                    
                }
            } label: {
                Text("Minecraft Core")
            }

        }
        .padding()
        .onChange(of: selectedVersion) { newValue in
            isShowingPurgeAlert = true
        }
        .alert(isPresented: $isShowingPurgeAlert) {
            Alert(title: Text("This will purge all your mods!"), message: Text("Changing Minecraft versions will purge all your mods."), primaryButton: .destructive(Text("Change Version"), action: {
                
                // This will happen when the user AGREES to change the version
                isShowingPurgeAlert = false
                
                print("Changed version")
                
            }), secondaryButton: .cancel(Text("Don't Change"), action: {
                
                // This will happen when the user DOES NOT AGREE to change the version
                isShowingPurgeAlert = false
                
                print("Did not change version")
                
            }))
        }
    }
}

