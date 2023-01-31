//
//  App State.swift
//  MCStart
//
//  Created by David Bureš on 25.11.2022.
//

import Foundation
import SwiftUI

class AppState: ObservableObject
{
    @Published var isShowingInstanceSettings: Bool = false
    @Published var currentlyOpenedSettingsTab: Int = 1

    @Published var isSignedInToMicrosoft: Bool = false

    @Published var isShowingAddCategorySheet: Bool = false
    @Published var isShowingAddInstanceSheet: Bool = false
}
