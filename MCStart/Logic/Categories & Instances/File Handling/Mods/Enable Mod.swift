//
//  Enable Mod.swift
//  MCStart
//
//  Created by David Bureš on 26.12.2022.
//

import Foundation

func enableMod(mod: Mod) -> Void {
    
    let modPathWithoutExtension: URL = mod.path.deletingPathExtension()
    
    do {
        try FileManager.default.moveItem(at: modPathWithoutExtension.appendingPathExtension("disabled"), to: modPathWithoutExtension.appendingPathExtension("jar"))
    } catch let error as NSError {
        print("Failed while moving mod: \(error)")
    }
}
