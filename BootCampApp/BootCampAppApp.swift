//
//  BootCampAppApp.swift
//  BootCampApp
//
//  Created by Francisco Landero on 07/10/24.
//

import SwiftUI

@main
struct BootCampAppApp: App {
    
    @State private var model = MoviesModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationStack{
                OnboardingView(movie: Movie.sample)
            }
        }
        .environment(model)
    }
}
