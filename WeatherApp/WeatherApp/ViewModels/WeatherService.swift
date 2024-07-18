//
//  WeatherViewModel.swift
//  WeatherApp
//
//  Created by Vasya Smetankin on 17.07.2024.
//

import Foundation


struct WeatherService {
    var WeatherStatuses: [Weather]
    
    init() {
        self.WeatherStatuses = [
            Weather(
                weatherTitle: "1 sunny",
                weatherType: .sunny,
                weatherAssetName: "WeatherIcon-22"
            ),
            Weather(
                weatherTitle: "2 cloudy",
                weatherType: .cloudy,
                weatherAssetName: "WeatherIcon-32"
            ),
            Weather(
                weatherTitle: "3 thunder",
                weatherType: .thunder,
                weatherAssetName: "WeatherIcon-14"
            ),
            Weather(
                weatherTitle: "4 windy",
                weatherType: .windy,
                weatherAssetName: "WeatherIcon-6"
            )
        ]
    }
    
    func getItemByIndex(index: Int) -> Weather {
        return WeatherStatuses[index]
    }
    
    
}
