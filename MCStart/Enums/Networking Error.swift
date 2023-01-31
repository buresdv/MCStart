//
//  Networking Error.swift
//  MCStart
//
//  Created by David Bureš on 31.12.2022.
//

import Foundation

enum NetworkingError: Error
{
    case failedToEncoreURL
    case receivedBadResponseCode
}
