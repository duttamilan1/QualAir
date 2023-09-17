//
//  FavoritesViewModel.swift
//  QualAir
//
//  Created by Milan Dutta on 9/16/23.
//

import Foundation

class FavoritesViewModel: ObservableObject {
    @Published var favoriteLocations: [Location] = []

    init() {
        loadFavorites()
    }

    func addFavoriteLocation(_ location: Location) {
        favoriteLocations.append(location)
        saveFavorites()
    }


    func removeFavoriteLocation(at index: Int) {
        favoriteLocations.remove(at: index)
        saveFavorites()
    }

    private func saveFavorites() {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(favoriteLocations) {
            UserDefaults.standard.set(encoded, forKey: "favoriteLocations")
        }
    }

    private func loadFavorites() {
        if let data = UserDefaults.standard.data(forKey: "favoriteLocations") {
            let decoder = JSONDecoder()
            if let locations = try? decoder.decode([Location].self, from: data) {
                favoriteLocations = locations
            }
        }
    }
}
