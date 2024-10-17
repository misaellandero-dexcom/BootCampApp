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
            VStack(spacing: 20) {
                Group {
                    Text("Find All Movies")
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                    Text("Search and find the greatest movies of all time")
                        .multilineTextAlignment(.center)
                        .fontWeight(.light)
                        .padding(.horizontal, 140)
                }
                .foregroundColor(.white)
                PrimaryButton()
                .padding(.horizontal, 20)
            }
            .zIndex(1)
            .padding(.top, 50)
            .background(.ultraThinMaterial)
            AsyncImage(url: imageURL) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)

            } placeholder: {
                placeholderImage
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
