//
//  Astronaut.swift
//  Moonshot
//
//  Created by Jenn Park on 2023-06-27.
//

import Foundation

struct Astronaut: Codable, Identifiable { // Codable so we can construct instances straight from JSON, Identifiable so we can use in ForEach
    let id: String
    let name: String
    let description: String
}
