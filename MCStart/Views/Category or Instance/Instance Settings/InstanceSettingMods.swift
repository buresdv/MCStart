//
//  InstanceSettingMods.swift
//  MCStart
//
//  Created by David Bureš on 25.11.2022.
//

import SwiftUI

struct InstanceSettingMods: View {
    
    @Binding var mods: [Mod]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            
            if !mods.isEmpty {
                Table(mods) {
                    TableColumn("Enabled") { mod in
                        Toggle("", isOn: Binding<Bool>(
                            get: {
                                return mod.isEnabled
                            },
                            set: {
                                if let index = mods.firstIndex(where: { $0.id == mod.id }) {
                                    mods[index].isEnabled = $0
                                }
                            }
                        ))
                    }
                    .width(30)
                    /*TableColumn("On") { toggleValue in
                        Toggle("", isOn: toggleValue.isEnabled)
                    }*/
                    TableColumn("Name", value: \.name)
                    TableColumn("Version", value: \.version)
                }
                
                HStack {
                    if mods.allSatisfy({ $0.isEnabled == true }) {
                        Button {
                            print("Would disable all")
                        } label: {
                            Text("Disable All")
                        }
                    } else if mods.allSatisfy({ $0.isEnabled == false }) {
                        Button {
                            print("Would enable all")
                        } label: {
                            Text("Enable All")
                        }
                    } else {
                        Button {
                            
                        } label: {
                            Text("Bulk Actions")
                        }
                        .disabled(true)
                    }
                    
                    Spacer()
                    
                    #warning("Switch this to the actual instance's mods folder after it's implemented")
                    OpenModsFolderButton(modsFolder: "/Applications")
                        .labelStyle(.titleOnly)

                }
            } else {
                VStack(alignment: .center) {
                    #warning("Switch this to the actual instance's mods folder after it's implemented")
                    NoticeView(noticeType: .notice, noticeText: "This instance has no mods installed", isFullscreen: false)
                    OpenModsFolderButton(modsFolder: "/Applications")
                        .labelStyle(.titleOnly)
                }
            }
        }
    }
}
