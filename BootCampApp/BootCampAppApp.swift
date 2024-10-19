//
//  BootCampAppApp.swift
//  BootCampApp
//
//  Created by Francisco Landero on 07/10/24.
//

import SwiftUI

@main
struct BootCampAppApp: App {
    
    //Movies model
    @State private var model = MoviesModel()
    
    @AppStorage("UserOnBoardingCompleted") var userOnBoardingCompleted = false
         
    var body: some Scene {
        WindowGroup {
            NavigationStack{
                if userOnBoardingCompleted {
                    MoviesList()
                } else {
                    OnboardingView(movie: Movie.sample, onboardingCompleted: $userOnBoardingCompleted)
                }
            }
            
        }
        .environment(model)
    }
}
