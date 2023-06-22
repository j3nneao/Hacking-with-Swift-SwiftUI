//
//  Transitions.swift
//  Animation
//
//  Created by Jenn Park on 2023-06-22.
//

import SwiftUI

struct Transitions: View {
    @State private var isShowingRed = false
    
    var body: some View {
        ZStack {
//            Button("Tap me") {
//                withAnimation {
//                    isShowingRed.toggle()
//                }
//            }
            
            Rectangle()
                .fill(.blue)
                .frame(width: 200, height: 200)
            
            if isShowingRed {
                Rectangle()
                    .fill(.red)
                    .frame(width: 200, height: 200)
                    .transition(.pivot)
//                    .transition(.asymmetric(insertion: .scale, removal: .opacity))
            }
        }
        .onTapGesture {
            withAnimation {
                isShowingRed.toggle()
            }
        }
    }
}

struct CornerRotateModifier: ViewModifier {
    let amount: Double
    let anchor: UnitPoint
    
    func body(content: Content) -> some View {
        content
            .rotationEffect(.degrees(amount), anchor: anchor)
            .clipped() // when the view rotates, the parts that are outside the rectangle don't get drawn
    }
}

extension AnyTransition {
    static var pivot: AnyTransition {
        .modifier(active: CornerRotateModifier(amount: -90, anchor: .topLeading),
                  identity: CornerRotateModifier(amount: 0, anchor: .topLeading))
    } // we can now apply the new modifier like .transition(.pivot)
}

struct Transitions_Previews: PreviewProvider {
    static var previews: some View {
        Transitions()
    }
}
