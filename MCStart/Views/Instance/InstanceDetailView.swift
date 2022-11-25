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
                        Divider()
                            .gridCellUnsizedAxes(
                                .horizontal)
                        GridRow {
                            Text("Created")
                            Text(instance.convertDateToPresentableFormat(date: instance.dateCreated))
                        }
                    }
                } label: {
                    Text("Instance Information")
                }

                
                Spacer()
                
                HStack {
                    Button {
                        print("Would open instance folder")
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
                
                TabView {
                    
                    InstanceSettingMods()
                        .tabItem {
                            Label("Mods", systemImage: "checklist")
                        }
                    
                    InstanceSettingJavaOptions()
                        .tabItem {
                            Label("Java Options", systemImage: "memorychip")
                        }
                    
                }
                .padding()
                .frame(
                    minWidth: 400,
                    maxWidth: .infinity,
                    minHeight: 0,
                    maxHeight: .infinity,
                    alignment: .leading
                )
                
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
            ToolbarItem(placement: .primaryAction) {
                Button {
                    print("Started")
                } label: {
                    Label("Start", systemImage: "play.fill")
                }

            }
            
            ToolbarItem(placement: .primaryAction) {
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