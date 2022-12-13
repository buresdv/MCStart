//
//  InstanceView.swift
//  MCStart
//
//  Created by David Bureš on 25.11.2022.
//

import SwiftUI

struct InstanceListView: View {
    
    @State var parentCategory: InstanceCategory
    @State var instanceTracker: [Instance] = []
    
    @State var searchString: String = ""
    
    @State private var newInstance: Instance = Instance(name: "", version: "", dateCreated: Date(), iconSymbolName: "", modLoader: .vanilla, mods: [], settings: InstanceSettings(javaExecutablePath: "", javaArguments: []))
    
    @State var isShowingAddInstanceSheet: Bool = false
    
    var body: some View {
        VStack {
            
            List {
                ForEach(instanceTracker) { instance in
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
    
    func move(from source: IndexSet, to destination: Int) -> Void {
        instanceTracker.move(fromOffsets: source, toOffset: destination)
    }
}
