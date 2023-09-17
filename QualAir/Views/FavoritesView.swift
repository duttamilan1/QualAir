//
//  FavoritesView.swift
//  QualAir
//
//  Created by Milan Dutta on 9/16/23.
//

import SwiftUI

struct FavoritesView: View {
    @ObservedObject var favoritesViewModel: FavoritesViewModel
    
    var body: some View {
        List {
            ForEach(favoritesViewModel.favoriteLocations) { location in
                VStack {
                    Text("Location: \(location.name)")
                    Text("Air Quality: Good")
                }
            }
        }
    }
}

struct FavoritesView_Previews: PreviewProvider {
    static var previews: some View {
        let favoritesViewModel = FavoritesViewModel()
        favoritesViewModel.favoriteLocations = [
            Location(name: "New York", latitude: 40.7128, longitude: -74.0060),
            Location(name: "Los Angeles", latitude: 34.0522, longitude: -118.2437),
            Location(name: "Chicago", latitude: 41.8781, longitude: -87.6298)
        ]
        
        return FavoritesView(favoritesViewModel: favoritesViewModel)
    }
}


