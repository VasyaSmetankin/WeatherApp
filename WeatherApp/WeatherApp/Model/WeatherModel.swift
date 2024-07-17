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
    var weatherName: String
    var weatherType: WeatherType
    
    
    init(weatherName: String, weatherType: WeatherType) {
        self.weatherName = weatherName
        self.weatherType = weatherType
    }
    
}

