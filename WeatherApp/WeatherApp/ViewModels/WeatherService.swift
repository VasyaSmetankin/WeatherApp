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
                weatherTitleKey: "weather_sunny",
                weatherType: .sunny,
                weatherAssetName: "WeatherIcon-22"
            ),
            Weather(
                weatherTitleKey: "weather_cloudy",
                weatherType: .cloudy,
                weatherAssetName: "WeatherIcon-32"
            ),
            Weather(
                weatherTitleKey: "weather_thunder",
                weatherType: .thunder,
                weatherAssetName: "WeatherIcon-14"
            ),
            Weather(
                weatherTitleKey: "weather_windy",
                weatherType: .windy,
                weatherAssetName: "WeatherIcon-6"
            ),
            Weather(
                weatherTitleKey: "weather_snowy",
                weatherType: .snowy,
                weatherAssetName: "WeatherIcon-35"
            ),
            Weather(
                weatherTitleKey: "weather_rainbow",
                weatherType: .rainbow,
                weatherAssetName: "WeatherIcon-44"
            ),
            Weather(
                weatherTitleKey: "weather_dawn",
                weatherType: .dawn,
                weatherAssetName: "WeatherIcon-24"
            ),
            Weather(
                weatherTitleKey: "weather_sunset",
                weatherType: .sunset,
                weatherAssetName: "WeatherIcon-23"
            )
        ]
    }
    
    func getItemByIndex(index: Int) -> Weather {
        return WeatherStatuses[index]
    }
}
