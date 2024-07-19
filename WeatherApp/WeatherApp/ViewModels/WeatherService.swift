//
//  WeatherViewModel.swift
//  WeatherApp
//
//  Created by Vasya Smetankin on 17.07.2024.
//

import Foundation
import UIKit


struct WeatherService {
    var WeatherStatuses: [Weather]
    init() {
        self.WeatherStatuses = [
            Weather(
                weatherTitle: "sunny",
                weatherType: .sunny,
                weatherAssetName: "WeatherIcon-22"
            ),
            Weather(
                weatherTitle: "cloudy",
                weatherType: .cloudy,
                weatherAssetName: "WeatherIcon-32"
            ),
            Weather(
                weatherTitle: "thunder",
                weatherType: .thunder,
                weatherAssetName: "WeatherIcon-14"
            ),
            Weather(
                weatherTitle: "windy",
                weatherType: .windy,
                weatherAssetName: "WeatherIcon-6"
            )
        ]
        
        
        
    }
    
    func getItemByIndex(index: Int) -> Weather {
        return WeatherStatuses[index]
    }
}
