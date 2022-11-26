//
//  DividerMaintainingGridWidth.swift
//  MCStart
//
//  Created by David Bureš on 26.11.2022.
//

import SwiftUI

struct DividerMaintainingGridWidth: View {
    var body: some View {
        Divider()
            .gridCellUnsizedAxes(.horizontal)
    }
}

struct DividerMaintainingGridWidth_Previews: PreviewProvider {
    static var previews: some View {
        DividerMaintainingGridWidth()
    }
}
