//
//  InstanceSettingJavaOptions.swift
//  MCStart
//
//  Created by David Bureš on 25.11.2022.
//

import SwiftUI

struct InstanceSettingJavaOptions: View {
    
    @Binding var settings: InstanceSettings
    
    @State private var newArgument: String = ""
    
    @State private var isShowingImportSheet: Bool = false
    @State private var isShowingExportSheet: Bool = false
    
    @State var massInsertedArguments: String = ""
    
    var body: some View {
        VStack {
            GroupBox {
                Grid(alignment: .leading) {
                    GridRow {
                        Text("Java Executable Path")
                        FileSystemPickerView(label: "Java Executable Path", pickerButtonLabel: "Select Java Installation", selectedPath: $settings.javaExecutablePath)
                    }
                    
                    DividerMaintainingGridWidth()
                    
                    GridRow {
                        VStack {
                            HStack {
                                Text("Java Arguments")
                                
                                Spacer()
                                
                                AdjustableLabelButton {
                                    Label("Import", systemImage: "square.and.arrow.down")
                                } action: {
                                    isShowingImportSheet.toggle()
                                }
                                
                                AdjustableLabelButton {
                                    Label("Export", systemImage: "square.and.arrow.up")
                                } action: {
                                    isShowingExportSheet.toggle()
                                }

                            }
                            List {
                                Section("Active Arguments") {
                                    ForEach(settings.javaArguments, id: \.self) { argument in
                                        Text(argument)
                                    }
                                }
                            }
                            .listStyle(.inset(alternatesRowBackgrounds: true))
                            
                            HStack {
                                TextField("Argument", text: $newArgument)
                                    .onSubmit {
                                        if newArgument.starts(with: "-") { // Is the user is trying to add an argument that starts with a dash, remove it before adding it. If this didn't happen, some arguments would have two dashes at the beginning
                                            newArgument.remove(at: newArgument.startIndex)
                                            
                                            addNewArgument()
                                        } else {
                                            addNewArgument()
                                        }
                                    }
                                AdjustableLabelButton {
                                    Label("Add Argument", systemImage: "plus")
                                } action: {
                                    addNewArgument()
                                }

                            }
                        }
                        .gridCellColumns(2)
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
        .sheet(isPresented: $isShowingImportSheet) {
            ImportArgumentSheet(isShowingSheet: $isShowingImportSheet, massInsertedArguments: $massInsertedArguments)
        }
        .sheet(isPresented: $isShowingExportSheet) {
            ExportArgumentSheet(isShowingSheet: $isShowingExportSheet, currentActiveArguments: settings.javaArguments)
        }
        .onChange(of: massInsertedArguments) { newValue in
            
            var massInsertedArgumentsSeparated: [String] = massInsertedArguments.components(separatedBy: "-")
            
            massInsertedArgumentsSeparated.remove(at: 0)
            
            for argument in massInsertedArgumentsSeparated {
                newArgument = argument
                addNewArgument()
            }
            
            print(massInsertedArguments)
        }
    }
    
    func addNewArgument() -> Void {
        let mostRecentArgument = newArgument.trimmingCharacters(in: .whitespacesAndNewlines)
        
        withAnimation {
            settings.javaArguments.append(mostRecentArgument)
        }
        
        newArgument = ""
    }
}
