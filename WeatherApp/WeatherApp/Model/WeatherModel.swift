//________________________________
//< created by Medvedev Konstantin >
//--------------------------------
//       \   ^__^
//        \  (oo)\_______
//           (__)\       )\/\
//               ||----w |
//               ||     ||


import Foundation







final class Weather {
    var weatherTitle: String
    var weatherType: WeatherType
    var weatherAssetName: String
    
    init(weatherTitle: String, weatherType: WeatherType, weatherAssetName: String) {
        self.weatherTitle = weatherTitle
        self.weatherType = weatherType
        self.weatherAssetName = weatherAssetName
    }
    
}

