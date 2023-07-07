//
//  ContentView.swift
//  Drawing
//
//  Created by Jenn Park on 2023-07-01.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Circle()
            .strokeBorder(.blue, lineWidth: 40)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
