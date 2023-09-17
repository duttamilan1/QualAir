//
//  AirQualityView.swift
//  QualAir
//
//  Created by Milan Dutta on 9/16/23.
//

import SwiftUI
import CoreLocation

struct AirQualityView: View {
    @ObservedObject var airQualityViewModel: AirQualityViewModel
    var userLocation: CLLocation?
    
    var body: some View {
        VStack(spacing: 20) {
            if let location = userLocation {
                Text("Current Location:")
                    .font(.title)
                    .bold()
                Text("\(location.coordinate.latitude), \(location.coordinate.longitude)")
                    .font(.body)
            } else {
                Text("Fetching location...")
                    .font(.title)
                    .italic()
            }
            
            Button(action: {
                if let location = userLocation {
                    airQualityViewModel.fetchAirQuality(for: location)
                }
            }) {
                Text("Fetch Air Quality")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .font(.title)
                    .cornerRadius(10)
            }
            
            if let airQualityData = airQualityViewModel.airQualityData {
                VStack {
                    Text("Air Quality:")
                        .font(.title)
                        .bold()
                    Text("\(airQualityData.city), \(airQualityData.state), \(airQualityData.country)")
                        .font(.body)
                }
            } else {
                Text("Air Quality data not available.")
                    .font(.title)
            }
        }
        .padding()
    }
}

struct AirQualityView_Previews: PreviewProvider {
    static var previews: some View {
        AirQualityView(airQualityViewModel: AirQualityViewModel(), userLocation: nil)
    }
}
