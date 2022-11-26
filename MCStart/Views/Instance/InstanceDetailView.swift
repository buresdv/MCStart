//
//  InstanceDetailView.swift
//  MCStart
//
//  Created by David Bureš on 25.11.2022.
//

import SwiftUI

struct InstanceDetailView: View {
    
    @State var instance: Instance
    
    @EnvironmentObject var appState: AppState
    
    var body: some View {
        HSplitView {
            VStack(alignment: .leading) {
                
                HStack(alignment: .center) {
                    
                    Image(systemName: instance.iconSymbolName)
                        .resizable()
                        .frame(width: 40, height: 40)
                    
                    EditableLabel($instance.name) {
                        print("New Name: \(instance.name)")
                    }
                    .font(.title)
                }
                .border(.blue)
                
                GroupBox {
                    Grid(alignment: .leading) {
                        GridRow {
                            Text("Version")
                            Text(instance.version)
                        }
                        DividerMaintainingGridWidth()
                        GridRow {
                            Text("Mod Loader")
                            Text(instance.modLoader.rawValue)
                        }
                    }
                } label: {
                    Text("Version Information")
                }

                GroupBox {
                    Grid(alignment: .leading) {
                        GridRow {
                            Text("Created")
                            Text(instance.convertDateToPresentableFormat(date: instance.dateCreated))
                        }
                        DividerMaintainingGridWidth()
                    }
                } label: {
                    Text("Statistics")
                }

                
                Spacer()
                
                HStack {
                    Button {
                        openFinder(at: AppGlobals.categoriesDirectoryPath)
                    } label: {
                        Text("Open Instance Folder")
                    }
                    
                    Spacer()
                    
                    
                }
            }
            .padding()
            .frame(
                minWidth: 200,
                maxWidth: .infinity,
                minHeight: 0,
                maxHeight: .infinity,
                alignment: .leading
            )
            
            if appState.isShowingInstanceSettings {
                
                TabView(selection: $appState.currentlyOpenedSettingsTab) {
                    InstanceSettingMinecraftOptions()
                        .tabItem {
                            Label("Minecraft", systemImage: "cube")
                        }
                        .tag(1)
                    InstanceSettingMods(mods: $instance.mods)
                        .tabItem {
                            Label("Mods", systemImage: "checklist")
                        }
                        .tag(2)
                    InstanceSettingJavaOptions(settings: $instance.settings)
                        .tabItem {
                            Label("Java Options", systemImage: "memorychip")
                        }
                        .tag(3)
                }
                .padding()
                .frame(
                    minWidth: 400,
                    maxWidth: .infinity,
                    minHeight: 0,
                    maxHeight: .infinity,
                    alignment: .leading
                )
                //Remember which tab was opened when switching between instances
                .onChange(of: appState.currentlyOpenedSettingsTab) { newValue in
                    appState.currentlyOpenedSettingsTab = newValue
                }
                
            }
        }
        .frame(
            minWidth: 400,
            maxWidth: .infinity,
            minHeight: 0,
            maxHeight: .infinity,
            alignment: .leading
        )
        .toolbar {
            ToolbarItemGroup(placement: .primaryAction) {
                    Button {
                        print("Started")
                    } label: {
                        Label("Start", systemImage: "play.fill")
                    }
                
                    Button {
                        withAnimation {
                            appState.isShowingInstanceSettings.toggle()
                        }
                    } label: {
                        Label("Instance Settings", systemImage: "gear")
                    }
            }
        }
    }
}
