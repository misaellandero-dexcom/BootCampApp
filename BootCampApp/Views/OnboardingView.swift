//
//  OnboardingView.swift
//  BootCampApp
//
//  Created by Ines Pacheco on 10/16/24.
//

import SwiftUI

struct OnboardingView: View {
    
    @Binding var onBoardingCompleted : Bool
    
    // The name of the local image resource located in 'Assets'
    let imageName = "FindingDory" //"image0"
    
    // The URL of the image to download
    let imageURL = URL(string: "https://lumiere-a.akamaihd.net/v1/images/02_kotpota_teaser_1sht_las_652fbe30.jpeg")
    
    var body: some View {
            VStack() {
                Spacer()
                Group {
                    Text("Find All Movies")
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                    Text("Search and find the greatest movies of all time")
                        .multilineTextAlignment(.center)
                        .fontWeight(.light)
                        .padding(.bottom, 20)
                }
                .foregroundColor(.white)
                PrimaryButton(action: {
                    onBoardingCompleted = true
                })
                .padding(.horizontal, 20)
                
            }
            .padding()
            .background{
                AsyncImage(
                    url: imageURL,
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
    OnboardingView(onBoardingCompleted: .constant(false))
}
