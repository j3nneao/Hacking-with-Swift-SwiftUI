//
//  GestureAnimation.swift
//  Animation
//
//  Created by Jenn Park on 2023-06-22.
//

import SwiftUI

struct GestureAnimation: View {
    let letters = Array("Hello SwiftUI")
    @State private var enabled = false
    @State private var dragAmount = CGSize.zero
    
    var body: some View {
        HStack(spacing: 0) {
            ForEach(0..<letters.count, id: \.self) { num in
                Text(String(letters[num]))
                    .padding(5)
                    .font(.title)
                    .background(enabled ? .blue : .red)
                    .offset(dragAmount)
                    .animation(.default.delay(Double(num) / 20), value: dragAmount)
            }
        }
        .gesture(
            DragGesture()
                .onChanged { dragAmount = $0.translation }
                .onEnded { _ in
                    dragAmount = .zero
                    enabled.toggle()
                }
        )
        
//        LinearGradient(gradient: Gradient(colors: [.yellow, .red]), startPoint: .topLeading, endPoint: .bottomTrailing)
//            .frame(width: 300, height: 300)
//            .clipShape(RoundedRectangle(cornerRadius: 10))
//            .offset(dragAmount)
//            .gesture(
//                DragGesture()
//                    .onChanged { dragAmount = $0.translation }
//                    .onEnded { _ in
//                        withAnimation(.spring()) { // explicit animation - animates just the release
//                            dragAmount = .zero
//                        }
//                    }
//            )
//            .animation(.spring(), value: dragAmount) // implicit animation - animates both drag and release
        
    }
}

struct GestureAnimation_Previews: PreviewProvider {
    static var previews: some View {
        GestureAnimation()
    }
}
