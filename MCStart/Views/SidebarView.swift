//
//  SidebarView.swift
//  MCStart
//
//  Created by David Bureš on 25.11.2022.
//

import SwiftUI

struct SidebarView: View
{
    @StateObject var appState: AppState

    @StateObject var instanceCategories: InstanceCategories

    @State private var newCategory: InstanceCategory = .init(name: "", iconSymbolName: "", instances: [])

    @State private var isDefaultItemActive = true

    @AppStorage("accentColor") var accentColor: Color = .black
    @AppStorage("accentColorAlsoAppliesToCategoryList") var accentColorAlsoAppliesToCategoryList: Bool = false

    var body: some View
    {
        List
        {
            ForEach(instanceCategories.categories)
            { category in
                NavigationLink
                {
                    InstanceListView(appState: appState, parentCategory: category)
                } label: {
                    Label(category.name, systemImage: category.iconSymbolName)
                        .if(accentColorAlsoAppliesToCategoryList, transform: { view in
                            view.foregroundColor(accentColor)
                        })
                }
            }
        }
        .listStyle(.sidebar)
        .toolbar
        {
            /* This would put the button up in the sidebar. Consider what looks nicer
             ToolbarItem {
                 Button {
                     print("Ahoj")
                 } label: {
                     Label("Add Category", systemImage: "plus")
                 }

             }*/
            ToolbarItemGroup(placement: .automatic)
            {
                Button
                {
                    toggleSidebar()
                } label: {
                    Label("Toggle Sidebar", systemImage: "sidebar.leading")
                }
            }
        }

        Spacer()
        VStack(alignment: .leading)
        {
            Button
            {
                appState.isShowingAddCategorySheet.toggle()

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
        .sheet(isPresented: $appState.isShowingAddCategorySheet)
        {
            AddCategorySheet(isShowingAddCategorySheet: $appState.isShowingAddCategorySheet, categoryTracker: instanceCategories, newCategory: $newCategory)
        }
    }
}
