//
//  App State.swift
//  MCStart
//
//  Created by David Bureš on 25.11.2022.
//

import Foundation

class AppState: ObservableObject {
    
    @Published var isShowingInstanceSettings: Bool = false
    @Published var currentlyOpenedSettingsTab: Int = 1
    
}
