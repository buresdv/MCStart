//
//  Acknowledged Contributor.swift
//  MCStart
//
//  Created by David Bureš on 31.12.2022.
//

import Foundation

struct AcknowledgedContributor: Identifiable
{
    var id: UUID = .init()

    let name: String
    let reasonForAcknowledgement: String
    let profileService: String
    let profileURL: URL
}
