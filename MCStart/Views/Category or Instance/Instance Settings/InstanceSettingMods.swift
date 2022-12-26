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
    
    @State var availableMods: [Mod]
    
    var body: some View {
        
        let pathToModsFolder: URL = AppGlobals.categoriesDirectoryPath.appendingPathComponent(parentCategory.id.uuidString, conformingTo: .directory).appendingPathComponent(instance.id.uuidString, conformingTo: .directory).appendingPathComponent("mods", conformingTo: .directory)
        
        VStack(alignment: .leading, spacing: 20) {
            
            if instance.modLoader == .vanilla {
                NoticeView(noticeType: .error, noticeText: "Vanilla instances don't support modding", isFullscreen: true)
            } else {
                if !availableMods.isEmpty {
                    Table(availableMods) {
                        TableColumn("On") { mod in
                            Toggle("", isOn: Binding<Bool>(
                                get: {
                                    return mod.isEnabled
                                },
                                set: {
                                    if let index = availableMods.firstIndex(where: { $0.id == mod.id }) {
                                        availableMods[index].isEnabled = $0
                                    }
                                    if mod.isEnabled {
                                        print("Will disable mod \(mod.name)")
                                        
                                        disableMod(mod: mod)
                                        
                                    } else {
                                        print("Will enable mod \(mod.name)")
                                        
                                        enableMod(mod: mod)
                                    }
                                }
                            ))
                        }
                        .width(30)

                        TableColumn("Name") { mod in
                            Text(mod.name)
                                .contextMenu {
                                    Button {
                                        
                                        withAnimation {
                                            availableMods = availableMods.filter({ $0.name != mod.name })
                                        }
                                        
                                        print("Will delete file: \(pathToModsFolder.appendingPathComponent(mod.name))")
                                        
                                        deleteFile(at: pathToModsFolder.appendingPathComponent(mod.name))
                                        
                                        print(mod.name)
                                    } label: {
                                        Text("Delete")
                                    }

                                }
                        }
                        TableColumn("Version") {
                            Text($0.version)
                        }
                    }
                    .frame(
                        minHeight: 0,
                        maxHeight: .infinity
                    )
                    
                } else {
                    VStack(alignment: .center) {
                        
                        NoticeView(noticeType: .notice, noticeText: "This instance has no mods installed", isFullscreen: true)
                        
                        #if DEBUG
                        Button {
                            print(pathToModsFolder)
                        } label: {
                            Text("DEBUG: Print path to mods folder")
                        }
                        #endif

                    }
                }
                
                
                
                HStack {

                    if availableMods.allSatisfy({ $0.isEnabled == true }) {
                        Button {
                            print("Will disable all")
                            
                            for mod in availableMods {
                                disableMod(mod: mod)
                            }
                            
                        } label: {
                            Text("Disable All")
                        }
                    } else if availableMods.allSatisfy({ $0.isEnabled == false }) {
                        Button {
                            print("Will enable all")
                            
                            for mod in availableMods {
                                enableMod(mod: mod)
                            }
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
                    
                    OpenModsFolderButton(modsFolder: pathToModsFolder)
                        .labelStyle(.titleOnly)
                    
                    Button {
                        print("Time to add some mods")
                        
                        #warning("TODO: Make it also possible to select more than one mod at a time")
                        let selectedFile = try? selectFile(canChooseFiles: true, canChooseDirectories: false, canChooseMultipleFiles: false, title: "Select mod file")
                        
                        if let selectedFile {
                            copyFile(from: selectedFile, to: pathToModsFolder)
                            
                            withAnimation {
                                availableMods.append(Mod(name: selectedFile.lastPathComponent, version: "57886", path: pathToModsFolder.appendingPathComponent(selectedFile.lastPathComponent, conformingTo: .archive), isEnabled: true))
                            }
                            
                            /*
                            do {
                                try FileManager.default.copyItem(at: selectedFile, to: pathToModsFolder)
                            } catch let error as NSError {
                                print("Failed while copying mod to the mods folder: \(error)")
                            }*/
                        }
                        
                    } label: {
                        Label("Install Mods", systemImage: "plus")
                            .labelStyle(.titleOnly)
                    }
                    .keyboardShortcut(.defaultAction)
                }
            }
        }
    }
}
