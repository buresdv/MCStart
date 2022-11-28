//
//  SidebarView.swift
//  MCStart
//
//  Created by David Bureš on 25.11.2022.
//

import SwiftUI

struct SidebarView: View {
    
    @StateObject var instanceCategories: InstanceCategories
    
    @State private var newCategory: InstanceCategory = InstanceCategory(name: "", iconSymbolName: "", instances: [Instance(name: "", version: "", dateCreated: Date(), iconSymbolName: "", modLoader: .vanilla, mods: [], settings: InstanceSettings(javaExecutablePath: "", javaArguments: []))])
    
    @State private var isDefaultItemActive = true
    
    @State private var isShowingAddCategorySheet: Bool = false
    
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
            Button {
                
                isShowingAddCategorySheet.toggle()
                
            } label: {
                Label("Add Category", systemImage: "plus")
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
        .sheet(isPresented: $isShowingAddCategorySheet) {
            AddCategorySheet(isShowingAddCategorySheet: $isShowingAddCategorySheet, categories: $instanceCategories.categories, newCategory: $newCategory)
        }
    }
}
