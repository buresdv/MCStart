//
//  InstanceSettingMods.swift
//  MCStart
//
//  Created by David Bureš on 25.11.2022.
//

import SwiftUI

struct InstanceSettingMods: View {
    
    @State var parentCategory: InstanceCategory
    @Binding var instance: Instance
    
    var body: some View {
        
        let pathToModsFolder: URL = AppGlobals.categoriesDirectoryPath.appendingPathComponent(parentCategory.id.uuidString, conformingTo: .directory).appendingPathComponent(instance.id.uuidString, conformingTo: .directory).appendingPathComponent("mods", conformingTo: .directory)
        
        VStack(alignment: .leading, spacing: 20) {
            
            if instance.modLoader == .vanilla {
                NoticeView(noticeType: .error, noticeText: "Vanilla instances don't support modding", isFullscreen: true)
            } else {
                if !instance.mods.isEmpty {
                    Table(instance.mods) {
                        TableColumn("Enabled") { mod in
                            Toggle("", isOn: Binding<Bool>(
                                get: {
                                    return mod.isEnabled
                                },
                                set: {
                                    if let index = instance.mods.firstIndex(where: { $0.id == mod.id }) {
                                        instance.mods[index].isEnabled = $0
                                    }
                                }
                            ))
                        }
                        .width(30)

                        TableColumn("Name", value: \.name)
                        TableColumn("Version", value: \.version)
                    }
                    
                    HStack {
                        if instance.mods.allSatisfy({ $0.isEnabled == true }) {
                            Button {
                                print("Would disable all")
                            } label: {
                                Text("Disable All")
                            }
                        } else if instance.mods.allSatisfy({ $0.isEnabled == false }) {
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
                        OpenModsFolderButton(modsFolder: pathToModsFolder)
                            .labelStyle(.titleOnly)

                    }
                } else {
                    VStack(alignment: .center) {
                        #warning("Switch this to the actual instance's mods folder after it's implemented")
                        NoticeView(noticeType: .notice, noticeText: "This instance has no mods installed", isFullscreen: false)
                        
                        #if DEBUG
                        Button {
                            print(pathToModsFolder)
                        } label: {
                            Text("DEBUG: Print path to mods folder")
                        }
                        #endif
                        
                        OpenModsFolderButton(modsFolder: pathToModsFolder)
                            .labelStyle(.titleOnly)
                    }
                }
            }
        }
    }
}
