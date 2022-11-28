//
//  AddInstanceSheet.swift
//  MCStart
//
//  Created by David Bureš on 28.11.2022.
//

import SwiftUI
import SymbolPicker

struct AddCategorySheet: View {
    
    @Binding var isShowingAddCategorySheet: Bool
    
    @Binding var categories: [InstanceCategory]
    @Binding var newCategory: InstanceCategory
    
    @State private var chosenSymbol: String = "magnifyingglass"
    
    @State private var isShowingSymbolPicker: Bool = false
    
    @State private var isShowingAlert: Bool = false
    @State private var activeAlert: ActiveAlert = .name
    
    var emptyCategory: InstanceCategory = InstanceCategory(name: "", iconSymbolName: "", instances: [Instance(name: "", version: "", dateCreated: Date(), iconSymbolName: "", modLoader: .vanilla, mods: [], settings: InstanceSettings(javaExecutablePath: "", javaArguments: []))])
    
    var body: some View {
        
        SheetWithHeadline(title: "Add Category") {
            VStack(alignment: .leading, spacing: 20) {
                Form {
                    
                    TextField("Category Name:", text: $newCategory.name)
                    
                    LabeledContent {
                        IconPicker(selectedSymbolName: $chosenSymbol)
                    } label: {
                        Text("Category Icon:")
                    }
                    
                }
                
                HStack {
                    CloseSheetButton(isShowingSheet: $isShowingAddCategorySheet, customButtonText: "Cancel")
                    
                    Spacer()
                    
                    Button {
                        
                        if newCategory.name == "" {
                            activeAlert = .name
                            
                            isShowingAlert.toggle()
                        } else {
                            
                            newCategory.iconSymbolName = chosenSymbol
                            
                            print("Will append: \(newCategory)")
                            
                            withAnimation {
                                categories.append(newCategory)
                            }
                            
                            isShowingAddCategorySheet.toggle()
                            
                            newCategory = emptyCategory
                        }
                        
                    } label: {
                        Label("Add", systemImage: "plus")
                            .labelStyle(.titleOnly)
                    }

                }
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
        .frame(
            minWidth: 400
        )
    }
}
