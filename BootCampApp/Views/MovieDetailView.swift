//
//  MovieDetailView.swift
//  BootCampApp
//
//  Created by Francisco Landero on 16/10/24.
//

import SwiftUI

struct MovieDetailView: View {
    
    @Environment(\.colorScheme) var colorScheme
    
    let movie: Movie
    
    var bgColor : Color {
        if colorScheme == .dark {
            return Color.black
        } else {
            return Color.white
        }
    }
    
    var body: some View {
        ZStack {
            
            AsyncImage(
                url: movie.imageURL,
                transaction: Transaction(animation: .easeIn(duration: 2))
            ) { phase in
                switch phase {
                case .success(let image):
                    BlurredImageBackground(image: image, blurHeight: 100)
                default:
                    BlurredImageBackground(image: Image(.inseptionTest), blurHeight: 100)
                }
            }
            .edgesIgnoringSafeArea(.all)
            
            
            ScrollView(.vertical){
                
                Text(movie.title.uppercased())
                    .font(.largeTitle)
                    .bold()
                
                Text(movie.tagline ?? "")
                    .font(.caption)
                    .bold()
                    .foregroundStyle(.secondary)
                
                
                HStack(spacing: 20) {
                    //Play trailer button
                    Bagde(text: "Trailer", image: "play")
                    
                    //Popularity Gauge
                    PopularityGauge(popularity: movie.unwrappedPopularity)
                    
                    //Release Date
                    ReleaseDateBadge(releaseDate: movie.unwrappedReleaseDate)
                    
                }
                
                ScrollView(.horizontal){
                    HStack{
                        GendersBadges(genders: movie.gendersArray)
                    }
                    .padding()
                }
                
                Spacer()
                
                Text(movie.overview ?? "")
                    .foregroundStyle(.secondary)
                    .padding()
                Spacer()
                movieRevenueBadge(revenue: movie.unwrappedRevenue, budget: movie.unwrappedBudget)
                
                Spacer()
                    .frame(height: 200)
                
            }
            .background {
                LinearGradient(colors: [bgColor, bgColor, bgColor, bgColor, .clear], startPoint: .bottom, endPoint: .top)
                    .offset(y: -150)
            }
            .offset(y:200)
        }
    }
}

struct movieRevenueBadge : View {
    var revenue: Double
    var budget: Double
    
    var body: some View {
        Gauge(value: revenue, in: 0...budget) {
            Text("Popularity")
        } currentValueLabel: {
            Text(Image(systemName: "dollarsign.arrow.trianglehead.counterclockwise.rotate.90"))
        } minimumValueLabel: {
            Text("\(revenue)")
        } maximumValueLabel: {
            Text("\(budget)")
        }
        .gaugeStyle(.accessoryCircularCapacity)
        .tint(.yellow)
        
        Text("Revenue ")
        + Text(revenue, format: .currency(code: "usd"))
        Text("Budget ")
        + Text(budget, format: .currency(code: "usd"))
    }
}

struct GendersBadges : View {
    var genders : [String]
    var body: some View {
        ForEach(genders, id: \.self){ gender in
            Bagde(text: gender, image: "star.fill", backgroud: .gray)
        }
    }
}

struct ReleaseDateBadge : View {
    var releaseDate : Date
    var body: some View {
        VStack{
            HStack{
                Image(systemName: "calendar")
                    .foregroundStyle(.yellow)
                Text("Release")
            }
            Text(releaseDate, format: .dateTime.day().month().year())
                .foregroundStyle(.yellow)
                .font(.caption)
        }
    }
}

struct PopularityGauge: View {
    var popularity : Double
    var body: some View {
        Gauge(value: popularity, in: 0...100) {
            Text("Popularity")
        } currentValueLabel: {
            Text(Image(systemName: "star.fill"))
            // Text(Int(movie.popularity ?? 0.0), format: .percent )
        } minimumValueLabel: {
            Text("\(Int(popularity))")
            
        } maximumValueLabel: {
            Text("\(Int(100))")
        }
        .gaugeStyle(.accessoryCircular)
        .tint(.yellow)
        .frame(width: .infinity)
    }
}

struct Bagde: View {
    var text: String
    var image : String = ""
    var backgroud : Color = .yellow
    var body: some View {
        Label(text, systemImage: image)
            .padding(8)
            .background(backgroud.opacity(0.5))
            .clipShape(
                RoundedRectangle(cornerRadius: 6)
            )
            .overlay(
                RoundedRectangle(cornerRadius: 6)
                    .stroke(backgroud, lineWidth: 2)
            )
    }
}

struct BackGroundImage : View {
    
    var bgColor : Color
    var imageURL: URL?
    
    var body: some View {
        bgColor
            .edgesIgnoringSafeArea(.all)
        AsyncImage(
            url: imageURL,
            content: { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .edgesIgnoringSafeArea(.all)
                    .offset(y:-400)
            },
            placeholder: {
                Image(.inseptionTest)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .edgesIgnoringSafeArea(.all)
                    .offset(y:-400)
            }
        )
    }
}


#Preview {
    MovieDetailView(movie: Movie.sample)
}
