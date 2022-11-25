//
//  SidebarView.swift
//  MCStart
//
//  Created by David Bureš on 25.11.2022.
//

import SwiftUI

struct SidebarView: View {
    
    @StateObject var instanceCategories: InstanceCategories
    
    @State private var isDefaultItemActive = true
    
    var body: some View {
        List {
            ForEach(instanceCategories.categories) { category in
                NavigationLink {
                    InstanceListView(category: category)
                } label: {
                    Label(category.name, systemImage: category.iconSymbolName)
                }

            }
        }
        .listStyle(.sidebar)
        .toolbar {
            ToolbarItem(placement: .navigation) {
                Button {
                    toggleSidebar()
                } label: {
                    Label("Toggle Sidebar", systemImage: "sidebar.leading")
                }

            }
        }
        
        Spacer()
        VStack(alignment: .leading) {
            HStack(alignment: .center) {
                Button {
                    print("Would add category")
                } label: {
                    Label("Add Category", systemImage: "plus")
                        .labelStyle(.iconOnly)
                }
                .buttonStyle(.plain)
                .padding(6)
            }
        }
        .frame(
            minWidth: 0,
            maxWidth: .infinity,
            alignment: .leading
        )
        .border(.red)
    }
}
