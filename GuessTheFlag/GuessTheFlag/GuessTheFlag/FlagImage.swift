//
//  FlagImage.swift
//  GuessTheFlag
//
//  Created by Jenn Park on 2023-06-15.
//

import SwiftUI

struct FlagImage: View {
    var country: String
    
    var body: some View {
        Image(country)
            .renderingMode(.original)
            .clipShape(Capsule())
            .shadow(radius: 5)
    }
}

struct FlagImage_Previews: PreviewProvider {
    static var previews: some View {
        FlagImage(country: "Italy")
    }
}
