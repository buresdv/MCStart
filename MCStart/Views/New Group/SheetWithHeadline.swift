//
//  SheetWithHeadline.swift
//  MCStart
//
//  Created by David Bureš on 28.11.2022.
//

import SwiftUI

struct SheetWithHeadline<Content: View>: View {
    
    @State var title: String?
    
    @ViewBuilder var content: Content
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            if let title {
                Text(title)
                    .font(.headline)
            }
            
            content
        }
        .padding()
    }
}
