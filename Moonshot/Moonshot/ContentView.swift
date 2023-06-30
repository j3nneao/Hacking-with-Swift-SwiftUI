//
//  ContentView.swift
//  Moonshot
//
//  Created by Jenn Park on 2023-06-27.
//

import SwiftUI

struct ContentView: View {
    @State private var showAsList = false
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    
    var body: some View {
        NavigationView {
            Group {
                if showAsList {
                    Main_ListView(astronauts: astronauts, missions: missions)
                } else {
                    Main_GridView(astronauts: astronauts, missions: missions)
                }
            }
            .navigationTitle("Moonshot")
            .preferredColorScheme(.dark)
            .toolbar {
                Button {
                    showAsList.toggle()
                } label: {
                    if showAsList {
                        Text("Grid View")
                    } else {
                        Text("List View")
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
