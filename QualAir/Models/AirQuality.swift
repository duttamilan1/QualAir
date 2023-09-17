//
//  AirQualityDataModel.swift
//  QualAir
//
//  Created by Milan Dutta on 9/14/23.
//

import Foundation

struct AirQualityData: Codable {
    let city: String
    let state: String
    let country: String
}


extension AirQualityData {
    static var decoder: JSONDecoder {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        return decoder
    }
}
