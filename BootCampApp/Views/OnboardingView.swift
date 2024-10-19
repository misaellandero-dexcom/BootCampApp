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
    let movie: Movie
    
    @Binding var onboardingCompleted : Bool
    
    var body: some View {
        VStack(spacing: 15) {
            
            Spacer()
            
            Group {
                Text(movie.title)
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                
                Text(movie.unwrappedReleaseDate, format: .dateTime.day().month().year())
                    .multilineTextAlignment(.center)
                    .fontWeight(.light)
                    .padding(.bottom, 20)
            }
            .foregroundColor(.white)
            .multilineTextAlignment(.center)
            
            PrimaryButton(action: {
                onboardingCompleted = true
            })
            .padding(.horizontal, 20)
            
        }
        .padding()
        .background{
            AsyncImage(
                url: movie.imageURL,
                transaction: Transaction(animation: .easeIn(duration: 2))
            ) { phase in
                switch phase {
                case .success(let image):
                    BlurredImageBackground(image: image)
                default:
                    BlurredImageBackground(image: Image(imageName))
                }
            }
            .edgesIgnoringSafeArea(.all)
        }
        
    }
    
    
    
    
    
}

#Preview {
    OnboardingView(movie: Movie.sample, onboardingCompleted: .constant(true))
}
