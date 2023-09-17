//
//  Location.swift
//  QualAir
//
//  Created by Milan Dutta on 9/16/23.
//

import Foundation

struct Location: Identifiable, Codable {
    var id = UUID()
    var name: String
    var latitude: Double
    var longitude: Double
}

