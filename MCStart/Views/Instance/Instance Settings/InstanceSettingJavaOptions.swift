//
//  InstanceSettingJavaOptions.swift
//  MCStart
//
//  Created by David Bureš on 25.11.2022.
//

import SwiftUI

struct InstanceSettingJavaOptions: View {
    
    @Binding var settings: InstanceSettings
    
    var body: some View {
        VStack {
            GroupBox {
                Grid(alignment: .leading) {
                    GridRow {
                        Text("Java Executable Path")
                        HStack {
                            TextField("Java Executable Path", text: $settings.javaExecutablePath)
                            Button {
                                do {
                                    let selectedPath = try selectFile(canChooseFiles: false, canChooseDirectories: true, title: "Select Java Installation")
                                    
                                    settings.javaExecutablePath = selectedPath.absoluteString
                                    
                                } catch let error as NSError {
                                    print(error)
                                }
                            } label: {
                                Label("Select Java Installation", systemImage: "magnifyingglass")
                                    .labelStyle(.iconOnly)
                            }

                        }
                    }
                }
            } label: {
                Text("Java Settings")
            }
            
            GroupBox {
                Grid(alignment: .leading) {
                    GridRow {
                        Text("Min Memory")
                        TextField("Min Memory", value: $settings.minMemory, formatter: NumberFormatter())
                    }
                    
                    GridRow {
                        Text("Max Memory")
                        TextField("Max Memory", value: $settings.maxMemory, formatter: NumberFormatter())
                    }
                }
            } label: {
                Text("Memory Settings")
            }
            
            Spacer()
        }
        .padding()
    }
}
