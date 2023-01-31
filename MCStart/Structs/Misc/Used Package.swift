//
//  Used Package.swift
//  MCStart
//
//  Created by David Bureš on 30.12.2022.
//

import Foundation

struct UsedPackage: Identifiable
{
    var id: UUID = .init()

    let name: String
    let whyIsItUsed: String
    let packageURL: URL
}
