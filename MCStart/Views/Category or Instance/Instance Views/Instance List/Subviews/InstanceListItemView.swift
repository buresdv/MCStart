//
//  InstanceListItemView.swift
//  MCStart
//
//  Created by David Bureš on 02.12.2022.
//

import SwiftUI

struct InstanceListItemView: View {
    
    @State var instance: Instance
    
    var body: some View {
        HStack(alignment: .firstTextBaseline) {
            Image(systemName: instance.iconSymbolName)
            
            VStack(alignment: .leading) {
                Text(instance.name)
                Text("\(instance.version) (\(instance.modLoader.rawValue))")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
        }
    }
}
