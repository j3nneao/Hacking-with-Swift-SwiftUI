//
//  BindingAnimation.swift
//  Animation
//
//  Created by Jenn Park on 2023-06-22.
//

import SwiftUI

struct BindingAnimation: View {
    @State private var animationAmount = 1.0
    
    var body: some View {
        VStack {
            Stepper("Scale Amount", value: $animationAmount.animation(), in: 1...10)
            Spacer()
            Button("Tap me") {
                animationAmount += 1
            }
            .padding(40)
            .background(.red)
            .foregroundColor(.white)
            .clipShape(Circle())
            .scaleEffect(animationAmount)
        }
    }
}

struct BindingAnimation_Previews: PreviewProvider {
    static var previews: some View {
        BindingAnimation()
    }
}
