//
//  ContentView.swift
//  QualAir
//
//  Created by Milan Dutta on 9/14/23.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedTab = 0
    @ObservedObject var locationViewModel = LocationViewModel()
    
    var body: some View {
        TabView(selection: $selectedTab) {
            NavigationView {
                AirQualityView(airQualityViewModel: AirQualityViewModel())
                    .navigationBarTitle("", displayMode: .inline)
                    .navigationBarTitleDisplayMode(.inline)
                    .toolbar {
                        ToolbarItem(placement: .principal) {
                            HStack {
                                Text("QualAir")
                                    .font(.largeTitle)
                                    .fontWeight(.bold)
                                Spacer()
                            }
                        }
                    }
            }
            .tabItem {
                Image(systemName: "cloud.fill")
                Text("Air Quality")
            }
            .tag(0)
            
            AddFavoriteView(favoritesViewModel: FavoritesViewModel(), locationViewModel: locationViewModel)
                .tabItem {
                    Image(systemName: "plus.app")
                    Text("Add Favorite")
                }
                .tag(1)
            
            FavoritesView(favoritesViewModel: FavoritesViewModel())
                .tabItem {
                    Image(systemName: "star.fill")
                    Text("Favorites")
                }
                .tag(2)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
