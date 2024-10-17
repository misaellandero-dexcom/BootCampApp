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
            VStack(spacing: 15) {
                Group {
                    Text("Find All Movies")
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                    Text("Search and find the greatest movies of all time")
                        .multilineTextAlignment(.center)
                        .fontWeight(.light)
                        .padding(.horizontal, 140)
                        .padding(.bottom, 20)
                }
                .foregroundColor(.white)
                PrimaryButton()
                .padding(.horizontal, 20)
            }
            .zIndex(1)
            .padding(.top, 50)
            AsyncImage(
                url: imageURL,
                transaction: Transaction(animation: .easeIn(duration: 2))
                    ) { phase in
                        switch phase {
                        case .success(let image):
                            blurredImageBackground(image)
                        default:
                            placeholderImage
                        }
                    }
            .edgesIgnoringSafeArea(.vertical)
        }
    }
    
    @ViewBuilder
    var placeholderImage: some View {
        blurredImageBackground(Image(imageName))
    }
    
    @ViewBuilder
    func blurredImageBackground(_ image: Image) -> some View {
        ZStack(alignment: .bottom) {
            image
                .resizable()
                .aspectRatio(contentMode: .fill)
            image
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 250, alignment: .bottom).clipped()
                .blur(radius: 10)
        }
    }
}

#Preview {
    OnboardingView()
}
