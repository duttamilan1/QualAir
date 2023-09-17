//
//  AddFavoriteView.swift
//  QualAir
//
//  Created by Milan Dutta on 9/16/23.
//

import SwiftUI

struct AddFavoriteView: View {
    @ObservedObject var favoritesViewModel: FavoritesViewModel
    @State private var locationName: String = ""
    @ObservedObject var locationViewModel: LocationViewModel
    
    var body: some View {
        VStack {
            TextField("Location Name", text: $locationName)
                .padding()
            
            Button(action: {
                guard !locationName.isEmpty else { return }
                if let location = locationViewModel.userLocation {
                    let newLocation = Location(name: locationName, latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
                    favoritesViewModel.addFavoriteLocation(newLocation)
                }
            }) {
                Text("Add Location")
            }
        }
        .padding()
        .navigationBarTitle("Add Favorite")
    }
}


struct AddFavoriteView_Previews: PreviewProvider {
    static var previews: some View {
        AddFavoriteView(favoritesViewModel: FavoritesViewModel(), locationViewModel: LocationViewModel())
    }
}
