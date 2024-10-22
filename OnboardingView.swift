//
//  OnboardingView.swift
//  BootCampApp
//
//  Created by Hugo Landines on 22/10/24.
//

import SwiftUI

struct OnboardingView: View {
    
    
    let imageName = "FindingDory"
    let movie: Movie
    
    
    var body: some View {
        VStack(spacing: 15) {
            Spacer()
            
            Group {
                Text(movie.title)
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                
                Text(movie.unwrappedReleaseDate, format:
                        .dateTime.day().month().year())
                        .fontWeight(.light)
            }
            .multilineTextAlignment(.center)
            .foregroundColor(.white)
           
            
            Button("Enter Now") {
                print("Enter Now Button")
            }
            .foregroundColor(.white)
   
        }
        .background {
            Image(imageName)
        }
      
        
       
        
    }
}

#Preview {
    OnboardingView(movie: Movie.sample)
}
