//
//  BootCampAppApp.swift
//  BootCampApp
//
//  Created by Francisco Landero on 07/10/24.
//

import SwiftUI

@main
struct BootCampAppApp: App {
    var body: some Scene {
        WindowGroup {
            OnboardingView(movie: Movie.sample)
        }
    }
}
