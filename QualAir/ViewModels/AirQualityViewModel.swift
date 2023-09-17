//
//  AirQualityViewModel.swift
//  QualAir
//
//  Created by Milan Dutta on 9/16/23.
//

import Foundation
import CoreLocation

class AirQualityViewModel: ObservableObject {
    private let dataService = AirQualityDataService()
    
    @Published var airQualityData: AirQualityData?
    
    func fetchAirQuality(for location: CLLocation) {
        Task {
            do {
                let airQualityData = try await dataService.fetchAirQuality(for: location)
                DispatchQueue.main.async {
                    self.airQualityData = airQualityData
                }
            } catch {
                print("Error fetching air quality data: \(error.localizedDescription)")
            }
        }
    }
}



