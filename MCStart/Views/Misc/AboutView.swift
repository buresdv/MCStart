//
//  AboutView.swift
//  MCStart
//
//  Created by David Bureš on 30.12.2022.
//

import SwiftUI

struct AboutView: View
{
    @State private var usedPackages: [UsedPackage] = [
        UsedPackage(name: "MSAL", whyIsItUsed: "Used for authenticating Minecraft accounts through Microsoft", packageURL: URL(string: "https://github.com/AzureAD/microsoft-authentication-library-for-objc")!),
        UsedPackage(name: "SymbolPicker", whyIsItUsed: "Picker for system icons, used for picking icons of categories and instances", packageURL: URL(string: "https://github.com/xnth97/SymbolPicker")!),
        UsedPackage(name: "DSFSearchField", whyIsItUsed: "SwiftUI wrapper for NSSearchField, because I am too lazy to write one myself", packageURL: URL(string: "https://github.com/dagronf/DSFSearchField")!),
    ]
    @State private var acknowledgedContributors: [AcknowledgedContributor] = [
        AcknowledgedContributor(name: "Giuliano Soria", reasonForAcknowledgement: "Helped implement Xbox authentication workflow", profileService: "Mastodon", profileURL: URL(string: "https://mstdn.social/@GiulianoSoriaP@mastodon.social")!),
    ]

    var body: some View
    {
        HStack(alignment: .top, spacing: 20)
        {
            Image(nsImage: NSImage(named: "AppIcon") ?? NSImage())
                .resizable()
                .frame(width: 100, height: 100)

            VStack(alignment: .leading, spacing: 20)
            {
                VStack(alignment: .leading)
                {
                    Text(NSApplication.appName!)
                        .font(.title)
                    Text("Version \(NSApplication.appVersion!) (\(NSApplication.buildVersion!))")
                        .font(.caption)
                }

                Text("© 2022 David Bureš. All rights reserved.")
                    .font(.subheadline)
                    .foregroundColor(.gray)

                VStack
                {
                    DisclosureGroup
                    {
                        List(usedPackages)
                        { package in
                            HStack
                            {
                                VStack(alignment: .leading)
                                {
                                    Text(package.name)
                                        .font(.headline)
                                    Text(package.whyIsItUsed)
                                        .font(.subheadline)
                                }

                                Spacer()

                                ButtonThatOpensWebsites(websiteURL: package.packageURL, buttonText: "GitHub")
                            }
                        }
                        .listStyle(.bordered(alternatesRowBackgrounds: true))
                        .frame(
                            minWidth: 0,
                            maxWidth: .infinity,
                            idealHeight: 100
                        )
                    } label: {
                        Text("Packages Used")
                    }
                    DisclosureGroup
                    {
                        List(acknowledgedContributors)
                        { contributor in
                            HStack
                            {
                                VStack(alignment: .leading)
                                {
                                    Text(contributor.name)
                                        .font(.headline)
                                    Text(contributor.reasonForAcknowledgement)
                                        .font(.subheadline)
                                }

                                Spacer()

                                ButtonThatOpensWebsites(websiteURL: contributor.profileURL, buttonText: contributor.profileService)
                            }
                        }
                        .listStyle(.bordered(alternatesRowBackgrounds: true))
                        .frame(
                            minWidth: 0,
                            maxWidth: .infinity,
                            idealHeight: 100
                        )
                    } label: {
                        Text("Acknowledged Contributors")
                    }
                }

                HStack
                {
                    Spacer()

                    AdjustableLabelButton
                    {
                        Label("Contact Me", systemImage: "paperplane")
                    } action: {
                        NSWorkspace.shared.open(URL(string: "https://twitter.com/davidbures")!)
                    }
                }
            }
            .frame(width: 300, alignment: .topLeading)
        }
        .padding()
    }
}
