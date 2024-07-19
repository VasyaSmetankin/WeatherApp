//
//  GradientService.swift
//  WeatherApp
//
//  Created by Vasya Smetankin on 18.07.2024.
//

import Foundation
import UIKit






struct BackgroundService {
    static let shared = BackgroundService()
    var weatherColors: [WeatherType : [UIColor]] = [
        .sunny : [.yellow],
        .windy : [.lightGray],
        .cloudy : [.gray],
        .thunder : [.darkGray],
        .snowy : [.lightGray]
    ]
}





