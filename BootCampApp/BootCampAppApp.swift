//
//  BootCampAppApp.swift
//  BootCampApp
//
//  Created by Francisco Landero on 07/10/24.
//


import SwiftUI

@main
struct BootCampAppApp: App {
    
    // Movies model
    @State private var model = MoviesModel()
    
    @AppStorage("UserOnBoardingCompleted") var userOnBoardingCompleted = false
    
    var body: some Scene {
        WindowGroup {
            Group {
                if userOnBoardingCompleted {
                    #if os(iOS)
                    iPhoneNavigation()
                    #else
                    OtherDevicesNavigation()
                    #endif
                } else {
                    OnboardingView(movie: Movie.sample, onboardingCompleted: $userOnBoardingCompleted)
                }
            }
            .accentColor(.yellow) 
        }
        .environment(model)
    }
}
