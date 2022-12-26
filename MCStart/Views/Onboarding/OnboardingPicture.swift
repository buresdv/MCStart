//
//  OnboardingPicture.swift
//  MCStart
//
//  Created by David Bureš on 17.12.2022.
//

import SwiftUI

struct OnboardingPicture: View {
    
    @State var systemName: String
    @State var accentColor: Color
    
    private let pictureSize: CGFloat = 35
    
    var body: some View {
        Image(systemName: systemName)
            .resizable()
            .foregroundStyle(accentColor)
            .aspectRatio(contentMode: .fill)
            .frame(width: pictureSize, height: pictureSize, alignment: .center)
    }
}
