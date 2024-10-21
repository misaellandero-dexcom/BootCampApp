//
//  iPhoneNavigation.swift
//  BootCampApp
//
//  Created by Francisco Landero on 18/10/24.
//

import SwiftUI

struct iPhoneNavigation: View {
    var body: some View {
        TabView {
            NavigationStack{
                MoviesList() 
                .navigationTitle("Movies")
            }.tabItem {
                Text("Home")
                Image(systemName: "house")
                    .renderingMode(.template)
            }
            
            NavigationStack{
                Text("Search")
                    .navigationTitle("Search")
            }.tabItem {
                Text("Search")
                Image(systemName: "magnifyingglass")
                    .renderingMode(.template)
            }
            
            NavigationStack{
                Text("Wishlist")
                    .navigationTitle("Wishlist")
            }.tabItem {
                Text("Wishlist")
                Image(systemName: "bookmark")
                    .renderingMode(.template)
            }
            
            NavigationStack{
                Text("Profile")
                    .navigationTitle("Profile")
            }.tabItem {
                Text("Profile")
                Image(systemName: "person")
                    .renderingMode(.template)
            }
        }
    }
}

#Preview {
    iPhoneNavigation()
        .environment(MoviesModel())
}
