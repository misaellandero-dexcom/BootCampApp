//
//  OtherDevicesNavigation.swift
//  BootCampApp
//
//  Created by Francisco Landero on 18/10/24.
//

import SwiftUI

struct OtherDevicesNavigation: View {
    var body: some View {
        NavigationSplitView {
            List{
                NavigationLink {
                    MoviesList()
                } label: {
                    HStack{
                        Label("Home", systemImage: "house")
                    }
                }
                NavigationLink {
                    Text("Search")
                        .navigationTitle("Search")
                } label: {
                    HStack{
                        Label("Search", systemImage: "magnifyingglass")
                    }
                }
                NavigationLink {
                    Text("Wishlist")
                            .navigationTitle("Wishlist")
                } label: {
                    HStack{
                        Label("Wishlist", systemImage: "bookmark")
                    }
                }
                NavigationLink {
                    Text("Profile")
                        .navigationTitle("Profile")
                } label: {
                    HStack{
                        Label("Profile", systemImage: "person")
                    }
                }
                
            }
            .navigationTitle("Movies")
        } detail: {
            ContentUnavailableView {
                                Label("No Movies yet", systemImage: "movieclapper.fill")
                            } description: {
                                Text("Movies search results will appear here.")
                            }
        }

    }
}

#Preview {
    OtherDevicesNavigation()
}
