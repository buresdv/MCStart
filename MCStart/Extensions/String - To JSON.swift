//
//  String - To JSON.swift
//  MCStart
//
//  Created by David Bureš on 30.12.2022.
//

import Foundation

extension String {
    func toJSON() -> Any? {
        guard let data = self.data(using: .utf8, allowLossyConversion: false) else {
            return nil
        }
        
        return try? JSONSerialization.jsonObject(with: data, options: .mutableContainers)
    }
}
