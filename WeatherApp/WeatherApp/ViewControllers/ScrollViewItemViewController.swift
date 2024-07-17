//________________________________
//< created by Medvedev Konstantin >
//--------------------------------
//       \   ^__^
//        \  (oo)\_______
//           (__)\       )\/\
//               ||----w |
//               ||     ||


import UIKit

class ScrollViewItemViewController: UIViewController {
    
    let imageView = UIImageView()
    let label = UILabel()
    
    
    let weatherItem = Weather(weatherName: "bruh", weatherType: .sunny)
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupImageView()
        setupLabel()

    }
    
    func setupImageView() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "WeatherIcon1AnyDark")
        view.addSubview(imageView)
        
        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -50),
            imageView.widthAnchor.constraint(equalToConstant: 200),
            imageView.heightAnchor.constraint(equalToConstant: 200)
        ])
    }
    
    func setupLabel() {
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Your label text"
        label.textAlignment = .center
        view.addSubview(label)
        
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20)
        ])
    }
}
