//________________________________
//< created by Medvedev Konstantin >
//--------------------------------
//       \   ^__^
//        \  (oo)\_______
//           (__)\       )\/\
//               ||----w |
//               ||     ||

import Foundation
import UIKit

struct BackgroundService {
    static let shared = BackgroundService()
    var weatherColors: [WeatherType : [UIColor]] = [
        .sunny : [.yellow],
        .windy : [.lightGray],
        .cloudy : [.gray],
        .thunder : [.darkGray],
        .snowy : [.darkGray, UIColor(red: 176/255, green: 196/255, blue: 222/255, alpha: 1)],
        .dawn : [UIColor(red: 253/255, green: 94/255, blue: 83/255, alpha: 1)],
        .sunset : [UIColor(red: 250/255, green: 128/255, blue: 114/255, alpha: 1)],
        .rainbow : [
            UIColor(red: 255/255, green: 0/255, blue: 0/255, alpha: 1),
            UIColor(red: 255/255, green: 127/255, blue: 0/255, alpha: 1),
            UIColor(red: 255/255, green: 255/255, blue: 0/255, alpha: 1),
            UIColor(red: 0/255, green: 255/255, blue: 0/255, alpha: 1),
            UIColor(red: 0/255, green: 0/255, blue: 255/255, alpha: 1),
            UIColor(red: 75/255, green: 0/255, blue: 130/255, alpha: 1),
            UIColor(red: 148/255, green: 0/255, blue: 211/255, alpha: 1)
        ]
    ]
}





