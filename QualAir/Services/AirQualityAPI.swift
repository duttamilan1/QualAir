//
//  AirQualityAPI.swift
//  QualAir
//
//  Created by Milan Dutta on 9/16/23.
//

import Foundation
import CoreLocation

struct AirQualityDataService {
    private let session: URLSession = .shared
    private let decoder: JSONDecoder = AirQualityData.decoder

    public func fetchAirQuality(for location: CLLocation) async throws -> AirQualityData {
        var components = URLComponents(string: "http://api.airvisual.com/v2/nearest_city")

        let apiKey = "429ded20-fc87-4184-8705-f341a5758648"

        components?.queryItems = [
            URLQueryItem(name: "lat", value: "\(location.coordinate.latitude)"),
            URLQueryItem(name: "lon", value: "\(location.coordinate.longitude)"),
            URLQueryItem(name: "key", value: apiKey)
        ]

        guard let url = components?.url else { fatalError("Invalid URL") }

        let (data, _) = try await session.data(from: url)

        do {
            let airQualityData = try decoder.decode(AirQualityData.self, from: data)
            return airQualityData
        } catch {
            throw error
        }
    }
}
