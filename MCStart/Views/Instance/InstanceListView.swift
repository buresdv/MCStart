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
    
    var body: some View {
        List {
            ForEach(category.instances) { instance in
                NavigationLink {
                    InstanceDetailView(instance: instance)
                } label: {
                    Label(instance.name, systemImage: instance.iconSymbolName)
                }
            }
            .onMove(perform: move)
        }
        .frame(minWidth: 260)
        .navigationTitle(category.name)
        .navigationSubtitle("\(category.instances.count) instances")
        .toolbar {
            ToolbarItem {
                Button {
                    print("Would Add")
                } label: {
                    Label("Add Instance", systemImage: "plus")
                }

            }
        }
    }
    
    func move(from source: IndexSet, to destination: Int) -> Void {
        category.instances.move(fromOffsets: source, toOffset: destination)
    }
}
