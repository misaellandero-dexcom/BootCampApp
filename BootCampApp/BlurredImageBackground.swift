//
//  BlurredImageBackground.swift
//  BootCampApp
//
//  Created by Francisco Landero on 17/10/24.
//

import SwiftUI

struct BlurredImageBackground: View {
    
    var image: Image
    var blurdheight : CGFloat = 200
    
    var body: some View {
        VStack{
            Spacer()
            image
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: blurdheight, alignment: .bottom).clipped()
                .blur(radius: 15)
        }
        .background{
            image
                .resizable()
                .aspectRatio(contentMode: .fill)

        }
    }
    
    
}

 

#Preview {
    BlurredImageBackground(image: Image(.findingDory))
}
