//
//  WarningView.swift
//  MCStart
//
//  Created by David Bureš on 26.11.2022.
//

import SwiftUI

enum NoticeTypes: String {
    case notice = "eyeglasses"
    case warning = "questionmark.diamond"
    case tip = "lightbulb"
    case error = "exclamationmark.triangle"
}

struct NoticeView: View {
    
    @State var noticeType: NoticeTypes
    @State var noticeText: String
    @State var isFullscreen: Bool
    
    var body: some View {
        VStack {
            VStack(spacing: 20) {
                Image(systemName: noticeType.rawValue)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 50, height: 50)
                Text(noticeText)
                    .font(.title)
                    .multilineTextAlignment(.center)
                    
            }
            .foregroundColor(Color(nsColor: NSColor.lightGray))
        }
        .if(isFullscreen, transform: { view in
            view.frame(
                minWidth: 0,
                maxWidth: .infinity,
                minHeight: 0,
                maxHeight: .infinity
            )
        })
    }
}
