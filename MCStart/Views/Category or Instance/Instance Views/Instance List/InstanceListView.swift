//
//  InstanceView.swift
//  MCStart
//
//  Created by David Bureš on 25.11.2022.
//

import DSFSearchField
import SwiftUI

struct InstanceListView: View
{
    @StateObject var appState: AppState

    @State var parentCategory: InstanceCategory
    @State var instanceTracker: [Instance] = []

    @State private var isShowingFilteringField: Bool = false
    @State private var instanceFilter: String = ""
    @FocusState private var isSearchFieldFocused: Bool

    @State private var newInstance: Instance = .init(name: "", version: "", dateCreated: Date(), iconSymbolName: "", modLoader: .vanilla, mods: [], settings: InstanceSettings(javaExecutablePath: "", javaArguments: []))

    @AppStorage("accentColor") var accentColor: Color = .black
    @AppStorage("accentColorAlsoAppliesToActiveButtonState") var accentColorAlsoAppliesToActiveButtonState: Bool = false

    var body: some View
    {
        VStack
        {
            if isShowingFilteringField
            {
                DSFSearchField.SwiftUI(text: $instanceFilter, placeholderText: "Filter Instances", autosaveName: "instance-search")
                { text in
                    print(text)
                }
                .focused($isSearchFieldFocused)
                .onExitCommand
                { // Hide the search field upon pressing "escape"
                    withAnimation
                    {
                        isShowingFilteringField.toggle()
                    }
                }
            }

            List
            {
                // Make the instances searchable
                ForEach(instanceTracker.filter { instanceFilter.isEmpty ? true : $0.name.localizedCaseInsensitiveContains(instanceFilter) })
                { instance in
                    NavigationLink
                    {
                        InstanceDetailView(parentCategory: parentCategory, instance: instance)
                    } label: {
                        InstanceListItemView(instance: instance)
                    }
                    .contextMenu
                    {
                        Button
                        {
                            print("\(instance.name): \(instance.id)")
                        } label: {
                            Text("Print instance name")
                        }

                        Divider()

                        Button
                        {
                            withAnimation
                            {
                                do
                                {
                                    try deleteInstance(parentCategoryUUID: parentCategory.id, instanceUUID: instance.id, instanceTracker: &instanceTracker)
                                }
                                catch let error as NSError
                                {
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
            .toolbar
            {
                ToolbarItemGroup(placement: .automatic)
                {
                    Button
                    {
                        withAnimation
                        {
                            isShowingFilteringField.toggle()
                        }

                        isSearchFieldFocused.toggle()
                    } label: {
                        if isShowingFilteringField
                        {
                            Label("Filter Instances", systemImage: "line.3.horizontal.decrease.circle.fill")
                                .if(accentColorAlsoAppliesToActiveButtonState, transform: { view in
                                    view.foregroundColor(accentColor)
                                })
                        }
                        else
                        {
                            Label("Filter Instances", systemImage: "line.3.horizontal.decrease.circle")
                        }
                    }
                    .keyboardShortcut("f", modifiers: [.command])
                }
            }

            Spacer()

            VStack(alignment: .leading)
            {
                Button
                {
                    appState.isShowingAddInstanceSheet.toggle()

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
        .onAppear
        {
            #warning("Maybe put this into a separate function")
            let pathToParentCategory: URL = getPathToCategoryFolderByUUID(categoryUUID: parentCategory.id)

            do
            {
                let decodedInstances: [Instance] = try decodeInstancesFromDisk(atCategoryPath: pathToParentCategory)

                instanceTracker = decodedInstances
            }
            catch let error as NSError
            {
                print("Failed while decoding instances in folder: \(error)")
            }
        }
        .sheet(isPresented: $appState.isShowingAddInstanceSheet)
        {
            AddInstanceSheet(isShowingSheet: $appState.isShowingAddInstanceSheet, parentCategory: $parentCategory, newInstance: $newInstance, instanceTracker: $instanceTracker)
        }
    }

    func move(from source: IndexSet, to destination: Int)
    {
        instanceTracker.move(fromOffsets: source, toOffset: destination)
    }
}
