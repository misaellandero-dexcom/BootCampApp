//
//  OnboardingView.swift
//  BootCampApp
//
//  Created by Ines Pacheco on 10/16/24.
//

import SwiftUI

struct OnboardingView: View {
    // The name of the local image resource located in 'Assets'
    let imageName = "FindingDory" //"image0"
    
    // The URL of the image to download
    let imageURL = URL(string: "https://lumiere-a.akamaihd.net/v1/images/02_kotpota_teaser_1sht_las_652fbe30.jpeg")
    
    var body: some View {
        ZStack(alignment: .bottom) {
            VStack(spacing: 10) {
                Group {
                    Text("Find All Movies")
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                    Text("Search and find the greatest movies of all time")
                        .multilineTextAlignment(.center)
                        .fontWeight(.light)
                        .padding(.horizontal, 140)
                }
                .padding(.bottom, 10)
                .foregroundColor(.white)
                PrimaryButton()
                .padding(.horizontal, 20)
            }
            .zIndex(1)
            .padding(.top, 50)
            .background(.ultraThinMaterial)
            AsyncImage(
                url: imageURL,
                transaction: Transaction(animation: .easeIn(duration: 2))
                    ) { phase in
                        switch phase {
                        case .success(let image):
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                        default:
                            placeholderImage
                        }
                    }
            .edgesIgnoringSafeArea(.vertical)
        }
    }
    
    @ViewBuilder
    var placeholderImage: some View {
        Image(imageName)
            .resizable()
            .aspectRatio(contentMode: .fill)
    }
}

#Preview {
    OnboardingView()
}
