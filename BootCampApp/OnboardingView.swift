//
//  OnboardingView.swift
//  BootCampApp
//
//  Created by Ines Pacheco on 10/16/24.
//

import SwiftUI

struct OnboardingView: View {
    var body: some View {
        ZStack(alignment: .bottom) {
            VStack(spacing: 20) {
                Group {
                    Text("Find All Movies")
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                    Text("Search and find the greatest movies of all times")
                        .multilineTextAlignment(.center)
                        .fontWeight(.light)
                        .padding(.horizontal, 140)
                }
                .foregroundColor(.white)
                Button {
                    print("Button tapped")
                } label: {
                    HStack {
                        Text("Enter Now")
                            .fontWeight(.bold)
                            .foregroundColor(.init(red: 0.261, green: 0.261, blue: 0.261))
                            .frame(maxWidth: .infinity)
                            .padding(10)
                            .background {
                                let cornerRadius = 15.0
                                RoundedRectangle(cornerRadius: cornerRadius)
                                .foregroundColor(.yellow)
                                .background {
                                    RoundedRectangle(cornerRadius: cornerRadius)
                                        .stroke(Color("PrimaryButttonBorderColor"), lineWidth: 2)
                                }
                            }
                            .padding(.horizontal, 80)
                    }
                }
                .tint(Color("PrimaryButtonColor"))
                .padding(.horizontal, 20)
            }
            .zIndex(1)
            .padding(.top, 50)
            .background(.ultraThinMaterial)
            Image("image0")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .edgesIgnoringSafeArea(.vertical)
        }
    }
}

#Preview {
    OnboardingView()
}
