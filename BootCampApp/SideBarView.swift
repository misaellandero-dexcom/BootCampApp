//
//  ContentView.swift
//  BootCampApp
//
//  Created by Francisco Landero on 07/10/24.
//

import SwiftUI

struct SideBarView: View {
   
    var body: some View {
        NavigationSplitView {
            List{
                NavigationLink(destination: MovieList()) {
                    Label("Movie Search", systemImage: "rectangle.and.text.magnifyingglass")
                }
                NavigationLink(destination: MovieList()) {
                    Label("Fav Movies", systemImage: "star.square.on.square")
                }
                NavigationLink(destination: MovieList()) {
                    Label("Movie Search", systemImage: "gear")
                }
            }
            .navigationTitle("Movies")
        } content: {
            MovieList()
        } detail: {
            Text("Detail View")
        }
    }
}

/*
#Preview {
    ContentView()
}
*/
