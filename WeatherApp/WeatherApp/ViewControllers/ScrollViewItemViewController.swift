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
    
    var imageView = UIImageView()
    var label = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupImageView()
        setupLabel()
    }
    
    convenience init(label: String, imagename: String) {
        self.init()
        self.label.text = label
        self.imageView.image = UIImage(named: imagename)
    }
    
    func setupImageView() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        //imageView.image = UIImage(named: "WeatherIcon-1")
        
        view.addSubview(imageView)
        
        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -50),
            imageView.widthAnchor.constraint(equalToConstant: 100),
            imageView.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
    
    func setupLabel() {
        label.translatesAutoresizingMaskIntoConstraints = false
        //label.text = "Your label text"
        label.textAlignment = .center
        view.addSubview(label)
        
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20)
        ])
    }
}
