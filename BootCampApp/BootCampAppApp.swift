//
//  BootCampAppApp.swift
//  BootCampApp
//
//  Created by Francisco Landero on 07/10/24.
//

import SwiftUI

@main
struct BootCampAppApp: App {
    
    //Var to save into the phone permante storage the state of the onboarding
    @AppStorage("UserOnBoardingCompleted") var UserOnBoardingCompleted = false
    
    var body: some Scene {
        WindowGroup {
            if UserOnBoardingCompleted {
                MovieDetailView(movie: Movie.sample)
            } else {
                OnboardingView(onBoardingCompleted: $UserOnBoardingCompleted)
            }
            
        }
    }
}
