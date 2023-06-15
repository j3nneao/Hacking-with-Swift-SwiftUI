//
//  ContentView.swift
//  CustomModifierChallenge
//
//  Created by Jenn Park on 2023-06-15.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Testing Title Modifier")
            .titleStyle()
    }
}

struct Title: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundColor(.blue)
    }
}

extension View {
    func titleStyle() -> some View {
        modifier(Title())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
