//
//  InstanceView.swift
//  MCStart
//
//  Created by David Bureš on 25.11.2022.
//

import SwiftUI

struct InstanceListView: View {
    
    @State var category: InstanceCategory
    
    @State var searchString: String = ""
    
    @State private var newInstance: Instance = Instance(name: "", version: "", dateCreated: Date(), iconSymbolName: "", modLoader: .vanilla, mods: [], settings: InstanceSettings(javaExecutablePath: "", javaArguments: []))
    
    @State var isShowingAddInstanceSheet: Bool = false
    
    var body: some View {
        VStack {
            
            List {
                ForEach(category.instances) { instance in
                    NavigationLink {
                        InstanceDetailView(instance: instance)
                    } label: {
                        Label(instance.name, systemImage: instance.iconSymbolName)
                    }
                }
                .onMove(perform: move)
                
                Spacer()
                
                
            }
            .frame(minWidth: 260)
            .navigationTitle(category.name)
            .navigationSubtitle("\(category.instances.count) instances")
            
            Spacer()
            
            VStack(alignment: .leading) {
                Button {
                    print("Would Add")
                    
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
        .sheet(isPresented: $isShowingAddInstanceSheet) {
            AddInstanceSheet(isShowingSheet: $isShowingAddInstanceSheet, parentCategory: $category, newInstance: $newInstance)
        }
    }
    
    func move(from source: IndexSet, to destination: Int) -> Void {
        category.instances.move(fromOffsets: source, toOffset: destination)
    }
}
