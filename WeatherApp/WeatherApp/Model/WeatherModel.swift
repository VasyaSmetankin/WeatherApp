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
    var weatherTitleKey: String
    var weatherType: WeatherType
    var weatherAssetName: String
    
    var weatherTitle: String {
        return NSLocalizedString(weatherTitleKey, comment: "")
    }
    
    init(weatherTitleKey: String, weatherType: WeatherType, weatherAssetName: String) {
        self.weatherTitleKey = weatherTitleKey
        self.weatherType = weatherType
        self.weatherAssetName = weatherAssetName
    }
}

