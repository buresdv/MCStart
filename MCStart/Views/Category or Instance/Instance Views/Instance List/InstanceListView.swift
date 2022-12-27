//
//  InstanceView.swift
//  MCStart
//
//  Created by David Bureš on 25.11.2022.
//

import SwiftUI
import DSFSearchField

struct InstanceListView: View {
    
    @State var parentCategory: InstanceCategory
    @State var instanceTracker: [Instance] = []
    
    @State var searchString: String = ""
    
    @State private var isShowingFilteringField: Bool = false
    @State private var instanceFilter: String = ""
    
    @State private var newInstance: Instance = Instance(name: "", version: "", dateCreated: Date(), iconSymbolName: "", modLoader: .vanilla, mods: [], settings: InstanceSettings(javaExecutablePath: "", javaArguments: []))
    
    @State var isShowingAddInstanceSheet: Bool = false
    
    @AppStorage("accentColor") var accentColor: Color = .black
    @AppStorage("accentColorAlsoAppliesToActiveButtonState") var accentColorAlsoAppliesToActiveButtonState: Bool = false
    
    var body: some View {
        VStack {
            
            if isShowingFilteringField {
                DSFSearchField.SwiftUI(text: $instanceFilter, placeholderText: "Filter Instances", autosaveName: "instance-search") { text in
                    
                    print(text)

                }
            }
            
            List {
                ForEach(filteredInstances) { instance in
                    NavigationLink {
                        InstanceDetailView(parentCategory: parentCategory, instance: instance)
                    } label: {
                        InstanceListItemView(instance: instance)
                    }
                    .contextMenu {
                        Button {
                            print("\(instance.name): \(instance.id)")
                        } label: {
                            Text("Print instance name")
                        }

                        Divider()
                        
                        Button {
                            withAnimation {
                                do {
                                    try deleteInstance(parentCategoryUUID: parentCategory.id, instanceUUID: instance.id, instanceTracker: &instanceTracker)
                                } catch let error as NSError {
                                    print("Failed while attempting to delete instance: \(error)")
                                }
                            }
                        } label: {
                            Text("Delete")
                        }

                    }

                }
                .onMove(perform: move)
                
                Spacer()
                
                
            }
            .frame(minWidth: 260)
            .navigationTitle(parentCategory.name)
            .navigationSubtitle("\(instanceTracker.count) instances")
            
            // This would put the button up in the sidebar. Consider what looks nicer
            .toolbar {
                ToolbarItemGroup(placement: .automatic) {
                    Button {
                        
                        withAnimation {
                            isShowingFilteringField.toggle()
                        }
                    } label: {
                        if isShowingFilteringField {
                            Label("Filter Instances", systemImage: "line.3.horizontal.decrease.circle.fill")
                                .if(accentColorAlsoAppliesToActiveButtonState, transform: { view in
                                    view.foregroundColor(accentColor)
                                })
                        } else {
                            Label("Filter Instances", systemImage: "line.3.horizontal.decrease.circle")
                        }
                    }
                    .keyboardShortcut("f", modifiers: [.command])
                }
            }
            
            Spacer()
            
            VStack(alignment: .leading) {
                Button {
                    
                    isShowingAddInstanceSheet.toggle()
                } label: {
                    Label("Add Instance", systemImage: "plus")
                        .labelStyle(.iconOnly)
                }
                .buttonStyle(.plain)
                .padding(.bottom, 6)
                .padding(.leading, 12)
            }
            .frame(
                minWidth: 0,
                maxWidth: .infinity,
                alignment: .leading
            )
            .background(Color.white)
        }
        .onAppear {
            #warning("Maybe put this into a separate function")
            let pathToParentCategory: URL = getPathToCategoryFolderByUUID(categoryUUID: parentCategory.id)
            
            do {
                
                let decodedInstances: [Instance] = try decodeInstancesFromDisk(atCategoryPath: pathToParentCategory)
                
                instanceTracker = decodedInstances
                
            } catch let error as NSError {
                print("Failed while decoding instances in folder: \(error)")
            }
        }
        .sheet(isPresented: $isShowingAddInstanceSheet) {
            AddInstanceSheet(isShowingSheet: $isShowingAddInstanceSheet, parentCategory: $parentCategory, newInstance: $newInstance, instanceTracker: $instanceTracker)
        }
    }
    
    var filteredInstances: [Instance] {
        if searchString.isEmpty {
            return instanceTracker
        } else {
            return instanceTracker.filter({ $0.name.localizedCaseInsensitiveContains(searchString) })
        }
    }
    
    func move(from source: IndexSet, to destination: Int) -> Void {
        instanceTracker.move(fromOffsets: source, toOffset: destination)
    }
}
