//
//  InstanceDetailView.swift
//  MCStart
//
//  Created by David Bureš on 25.11.2022.
//

import SwiftUI

struct InstanceDetailView: View
{
    @State var parentCategory: InstanceCategory
    @State var instance: Instance

    @EnvironmentObject var appState: AppState

    @AppStorage("accentColor") var accentColor: Color = .black
    @AppStorage("accentColorAlsoAppliesToActiveButtonState") var accentColorAlsoAppliesToActiveButtonState: Bool = false

    @State var availableMods: [Mod] = []

    var body: some View
    {
        let pathToModsFolder: URL = getPathToModsFolder(categoryUUID: parentCategory.id, instanceUUID: instance.id)

        HSplitView
        {
            VStack(alignment: .leading)
            {
                HStack(alignment: .center)
                {
                    Image(systemName: instance.iconSymbolName)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 40)
                        .foregroundStyle(accentColor)

                    EditableLabel($instance.name)
                    {
                        print("New Name: \(instance.name)")
                    }
                    .font(.title)
                }
                // .border(.blue)

                GroupBox
                {
                    Grid(alignment: .leading)
                    {
                        GridRow
                        {
                            Text("Version")
                            Text(instance.version)
                        }
                        DividerMaintainingGridWidth()
                        GridRow
                        {
                            Text("Mod Loader")
                            Text(instance.modLoader.rawValue)
                        }
                    }
                } label: {
                    Text("Version Information")
                }

                GroupBox
                {
                    Grid(alignment: .leading)
                    {
                        GridRow
                        {
                            Text("Created")
                            Text(instance.convertDateToPresentableFormat(date: instance.dateCreated))
                        }
                        DividerMaintainingGridWidth()
                    }
                } label: {
                    Text("Statistics")
                }

                Spacer()

                HStack
                {
                    AdjustableLabelButton
                    {
                        Label("Open Instance Folder", systemImage: "folder")
                    } action: {
                        let pathToParentCategory: URL = AppGlobals.categoriesDirectoryPath.appendingPathComponent(parentCategory.id.uuidString, conformingTo: .directory)
                        let pathToInstance: URL = pathToParentCategory.appendingPathComponent(instance.id.uuidString, conformingTo: .directory)

                        print("Trying to open \(pathToInstance)")

                        openFinder(at: pathToInstance)
                    }

                    Spacer()
                }
            }
            .padding()
            .frame(
                minWidth: 200,
                maxWidth: .infinity,
                minHeight: 0,
                maxHeight: .infinity,
                alignment: .leading
            )

            if appState.isShowingInstanceSettings
            {
                TabView(selection: $appState.currentlyOpenedSettingsTab)
                {
                    InstanceSettingMinecraftOptions()
                        .tabItem
                        {
                            Label("Minecraft", systemImage: "cube")
                        }
                        .tag(1)
                    InstanceSettingMods(parentCategory: parentCategory, instance: $instance, availableMods: availableMods)
                        .tabItem
                        {
                            Label("Mods", systemImage: "checklist")
                        }
                        .tag(2)
                    InstanceSettingJavaOptions(settings: $instance.settings)
                        .tabItem
                        {
                            Label("Java Options", systemImage: "memorychip")
                        }
                        .tag(3)
                }
                .padding()
                .frame(
                    minWidth: 400,
                    maxWidth: .infinity,
                    minHeight: 0,
                    maxHeight: .infinity,
                    alignment: .leading
                )
                // Remember which tab was opened when switching between instances
                .onChange(of: appState.currentlyOpenedSettingsTab)
                { newValue in
                    appState.currentlyOpenedSettingsTab = newValue
                }
            }
        }
        .onAppear
        {
            // Initialize mod view
            let contentsOfModsFolder = try! getContentsOfFolder(at: pathToModsFolder, returns: .files)

            for pathToMod in contentsOfModsFolder
            {
                let fixedPathToMod = pathToMod.path

                if fixedPathToMod.hasSuffix("jar")
                {
                    availableMods.append(Mod(name: pathToMod.lastPathComponent, version: "1234", path: pathToMod, isEnabled: true))
                }
                else
                {
                    availableMods.append(Mod(name: pathToMod.lastPathComponent, version: "4321", path: pathToMod, isEnabled: false))
                }
            }
        }
        .frame(
            minWidth: 400,
            maxWidth: .infinity,
            minHeight: 0,
            maxHeight: .infinity,
            alignment: .leading
        )
        .toolbar
        {
            ToolbarItemGroup(placement: .automatic)
            {
                Button
                {
                    appState.isShowingInstanceSettings.toggle()
                } label: {
                    if appState.isShowingInstanceSettings
                    {
                        Label("Instance Settings", systemImage: "gearshape.fill")
                            .if(accentColorAlsoAppliesToActiveButtonState)
                            { view in
                                view.foregroundColor(accentColor)
                            }
                    }
                    else
                    {
                        Label("Instance Settings", systemImage: "gearshape")
                    }
                }

                Spacer()

                Button
                {
                    print("Started")
                } label: {
                    Label("Start", systemImage: "play.fill")
                }
            }
        }
    }
}
