//
//  Disable Mod.swift
//  MCStart
//
//  Created by David Bureš on 26.12.2022.
//

import Foundation

func disableMod(mod: Mod)
{
    let modPathWithoutExtension: URL = mod.path.deletingPathExtension()

    do
    {
        try FileManager.default.moveItem(at: modPathWithoutExtension.appendingPathExtension("jar"), to: modPathWithoutExtension.appendingPathExtension("disabled"))
    }
    catch let error as NSError
    {
        print("Failed while moving mod: \(error)")
    }
}
