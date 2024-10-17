//
//  OnboardingView.swift
//  BootCampApp
//
//  Created by Ines Pacheco on 10/16/24.
//

import SwiftUI

struct OnboardingView: View {
    var body: some View {
        ZStack(alignment: .bottom) {
            Image("image0")
//                .resizable()
//                .aspectRatio(contentMode: .fill)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background() {
            Color.pink
        }
        .edgesIgnoringSafeArea(.all)

    }
}

#Preview {
    OnboardingView()
}
