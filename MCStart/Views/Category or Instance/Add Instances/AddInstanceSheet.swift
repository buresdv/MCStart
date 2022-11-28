//
//  AddInstanceSheet.swift
//  MCStart
//
//  Created by David Bureš on 28.11.2022.
//

import SwiftUI

struct AddInstanceSheet: View {
    
    @Binding var isShowingSheet: Bool
    
    @Binding var parentCategory: InstanceCategory
    
    @Binding var newInstance: Instance
    
    @State private var chosenSymbol: String = "magnifyingglass"
    
    var emptyInstance: Instance = Instance(name: "", version: "", dateCreated: Date(), iconSymbolName: "", modLoader: .vanilla, mods: [], settings: InstanceSettings(javaExecutablePath: "", javaArguments: []))
    
    var availableVersions: [String] = ["1.19.2", "1.19.1", "1.19", "1.18.2", "1.18.1"]
    
    @State private var isShowingAlert: Bool = false
    @State private var activeAlert: ActiveAlert = .name
    
    var body: some View {
        SheetWithHeadline(title: "Add Instance") {
            
            Form {
                
                TextField("Instance Name:", text: $newInstance.name)
                
                LabeledContent {
                    IconPicker(selectedSymbolName: $chosenSymbol)
                } label: {
                    Text("Instance Icon:")
                }
                
                Picker("Game Version:", selection: $newInstance.version) {
                    ForEach(availableVersions, id: \.self) { version in
                        Text(version)
                    }
                }
                
                DisclosureGroup("Memory Settings") {
                    Form {
                        TextField("Min Memory:", value: $newInstance.settings.minMemory, formatter: NumberFormatter())
                        TextField("Max Memory:", value: $newInstance.settings.maxMemory, formatter: NumberFormatter())
                    }
                }

                DisclosureGroup("Java Settings") {
                    TextField("Java Path", text: $newInstance.settings.javaExecutablePath)
                }
            }
            
            HStack {
                CloseSheetButton(isShowingSheet: $isShowingSheet, customButtonText: "Cancel")
                
                Spacer()
                
                Button {
                    
                    if newInstance.name == "" {
                        
                        // Name Empty
                        
                        print("Arrived to Name Alert")
                        
                        activeAlert = .name
                        isShowingAlert.toggle()
                        
                    } else if newInstance.version == "" {
                        
                        // Version Empty
                        
                        print("Arrived to Version Alert")
                        
                        activeAlert = .version
                        isShowingAlert.toggle()
                        
                    } else if newInstance.settings.minMemory != nil || newInstance.settings.maxMemory != nil { // If the user defined any min or max memory...
                        
                        print("Arrived to instance memory check")
                        
                        if newInstance.settings.minMemory! >= newInstance.settings.maxMemory! {
                            
                            // Check if min is not larger or equal to max memory
                            activeAlert = .memory
                            isShowingAlert.toggle()
                            
                        }
                        
                    } else {
                        
                        print("Arrived to instance creation")
                        
                        newInstance.iconSymbolName = chosenSymbol
                        
                        print("Will append \(newInstance)")
                        
                        withAnimation {
                            parentCategory.instances.append(newInstance)
                        }
                        
                        isShowingSheet = false
                        
                        newInstance = emptyInstance
                    }
                    
                } label: {
                    Label("Add", systemImage: "plus")
                        .labelStyle(.titleOnly)
                }

            }
            .alert(isPresented: $isShowingAlert) {
                switch activeAlert {
                case .name:
                    return Alert(title: Text("Instance Name Empty"), message: Text("Please name your instance"), dismissButton: .default(Text("Close")))
                case .version:
                    return Alert(title: Text("No Version Selected"), message: Text("Please choose a game version"), dismissButton: .default(Text("Close")))
                case .memory:
                    return Alert(title: Text("Min Memory Larger or Equal to Max Memory"), message: Text("Minimum memory cannot be larger or equal to maximum memory"), dismissButton: .default(Text("Close")))
                }
            }
        }
        .frame(
            minWidth: 400
        )
    }
}
