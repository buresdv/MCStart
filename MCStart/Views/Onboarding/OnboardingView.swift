//
//  OnboardingView.swift
//  MCStart
//
//  Created by David Bureš on 17.12.2022.
//

import SwiftUI

struct OnboardingView: View {
    
    @Binding var isShowingSheet: Bool
    
    var body: some View {
        VStack(spacing: 30) {
            VStack {
                Text("Welcome to MCStart")
                    .font(.largeTitle)
                Text("The fully native Minecraft launcher")
                    .font(.subheadline)
            }
            Grid(horizontalSpacing: 25, verticalSpacing: 30) {
                GridRow(alignment: .top) {
                    OnboardingPicture(systemName: "play.square.stack.fill", accentColor: .blue)
                    VStack(alignment: .leading) {
                        Text("As Many Versions as You'd Like")
                            .font(.headline)
                        Text("Vestibulum dictum dapibus neque, a varius lectus congue at. Suspendisse efficitur cursus justo eget tempor. Etiam tincidunt sit amet elit id elementum")
                    }
                }
                GridRow(alignment: .top) {
                    OnboardingPicture(systemName: "rectangle.3.group.fill", accentColor: .orange)
                    VStack(alignment: .leading) {
                        Text("Manage Unlimited Categories and Instances")
                            .font(.headline)
                        Text("Sed et elementum turpis. Nulla facilisi. Morbi non eleifend sapien. Phasellus lectus dui, consequat quis tristique vel, convallis eu nulla. ")
                    }
                }
                GridRow(alignment: .top) {
                    OnboardingPicture(systemName: "aqi.medium", accentColor: .mint)
                    VStack(alignment: .leading) {
                        Text("Modloaders Fully Supported")
                            .font(.headline)
                        Text("Maecenas id augue suscipit, rutrum elit nec, tincidunt ipsum. Morbi eget tristique enim. In varius augue quam, nec cursus erat interdum ut.")
                    }
                }
                GridRow(alignment: .top) {
                    OnboardingPicture(systemName: "cloud.fill", accentColor: .blue)
                    VStack(alignment: .leading) {
                        Text("You Won't Even Know It's There")
                            .font(.headline)
                        Text("Some super long text that will explain what is happening")
                    }
                }
            }
            .frame(width: 350)
            .padding()
            
            AdjustableLabelButton {
                Label("Start Using MCStart", systemImage: "play.fill")
            } action: {
                isShowingSheet.toggle()
            }
            .buttonStyle(.borderedProminent)
            
        }
        .padding()
    }
}
