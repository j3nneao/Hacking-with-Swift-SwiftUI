//
//  Main-ListView.swift
//  Moonshot
//
//  Created by Jenn Park on 2023-06-30.
//

import SwiftUI

struct Main_ListView: View {
    let astronauts: [String: Astronaut]
    let missions: [Mission]
    
    var body: some View {
        List {
            ForEach(missions) { mission in
                NavigationLink {
                    MissionView(mission: mission, astronauts: astronauts)
                } label: {
                    Text(mission.displayName)
                }
            }
            .listRowBackground(Color.darkBackground)
        }
        .listStyle(.plain)
        .padding([.horizontal, .top])
        .background(.darkBackground)
    }
}

struct Main_ListView_Previews: PreviewProvider {
    static let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    static let missions: [Mission] = Bundle.main.decode("missions.json")
    
    static var previews: some View {
        Main_ListView(astronauts: astronauts, missions: missions)
            .preferredColorScheme(.dark)
    }
}
