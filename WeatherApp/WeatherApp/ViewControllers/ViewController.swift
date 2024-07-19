//________________________________
//< created by Medvedev Konstantin >
//--------------------------------
//       \   ^__^
//        \  (oo)\_______
//           (__)\       )\/\
//               ||----w |
//               ||     ||


import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {
    
     var weatherService = WeatherService()
     
     let scrollView = UIScrollView()
     let contentView = UIView()
     let itemWidth: CGFloat = 150.0
     
     override func viewDidLoad() {
         super.viewDidLoad()
         setupBackgroundGradientViewController()
         setupScrollView()
         setupContentView()
         addContentToScrollView()
     }
     
     func setupBackgroundGradientViewController() {
         let gradientVC = PhaseGradientViewController()
         addChild(gradientVC)
         view.addSubview(gradientVC.view)
         gradientVC.view.frame = view.bounds
         gradientVC.didMove(toParent: self)
     }
     
     func setupScrollView() {
         scrollView.translatesAutoresizingMaskIntoConstraints = false
         scrollView.delegate = self
         scrollView.showsHorizontalScrollIndicator = false
         scrollView.frame = view.bounds
         scrollView.contentSize = CGSize(width: view.frame.width * CGFloat(weatherService.WeatherStatuses.count * 2), height: view.frame.height)
         scrollView.isPagingEnabled = true
         view.addSubview(scrollView)
         
         NSLayoutConstraint.activate([
             scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
             scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
             scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
             scrollView.heightAnchor.constraint(equalToConstant: 200)
         ])
     }
     
     func setupContentView() {
         view.backgroundColor = UIColor.clear
         contentView.translatesAutoresizingMaskIntoConstraints = false
         scrollView.addSubview(contentView)
         
         NSLayoutConstraint.activate([
             contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
             contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
             contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
             contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
             contentView.heightAnchor.constraint(equalTo: scrollView.heightAnchor)
         ])
     }
     
     func addContentToScrollView() {
         var previousView: UIView? = nil
         let totalCount = weatherService.WeatherStatuses.count * 2
         
         for i in 0..<totalCount {
             let content = weatherService.getItemByIndex(index: i % weatherService.WeatherStatuses.count)
             let contentViewController = ScrollViewItemViewController(label: content.weatherTitle, imagename: content.weatherAssetName)
             addChild(contentViewController)
             contentViewController.view.translatesAutoresizingMaskIntoConstraints = false
             contentViewController.didMove(toParent: self)
             contentView.addSubview(contentViewController.view)
             
             NSLayoutConstraint.activate([
                 contentViewController.view.topAnchor.constraint(equalTo: contentView.topAnchor),
                 contentViewController.view.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
                 contentViewController.view.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
             ])
             
             if let previousView = previousView {
                 contentViewController.view.leadingAnchor.constraint(equalTo: previousView.trailingAnchor).isActive = true
             } else {
                 contentViewController.view.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
             }
             
             previousView = contentViewController.view
         }
         
         if let previousView = previousView {
             previousView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
         }
         
         // Начальная позиция
         scrollView.contentOffset = CGPoint(x: scrollView.frame.width * CGFloat(weatherService.WeatherStatuses.count), y: 0)
     }
     
     func scrollViewDidScroll(_ scrollView: UIScrollView) {
         let contentOffsetX = scrollView.contentOffset.x
         let pageWidth = scrollView.bounds.width
         let page = contentOffsetX / pageWidth
         
         if contentOffsetX <= 0 {
             scrollView.contentOffset = CGPoint(x: pageWidth * CGFloat(weatherService.WeatherStatuses.count), y: 0)
         } else if contentOffsetX >= pageWidth * CGFloat(weatherService.WeatherStatuses.count * 2 - 1) {
             scrollView.contentOffset = CGPoint(x: pageWidth * CGFloat(weatherService.WeatherStatuses.count - 1), y: 0)
         }
     }
     
     func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
         let contentOffsetX = scrollView.contentOffset.x
         let pageWidth = scrollView.bounds.width
         let page = contentOffsetX / pageWidth
         
         if page == 0 {
             scrollView.contentOffset = CGPoint(x: pageWidth * CGFloat(weatherService.WeatherStatuses.count), y: 0)
         } else if page == CGFloat(weatherService.WeatherStatuses.count * 2 - 1) {
             scrollView.contentOffset = CGPoint(x: pageWidth * CGFloat(weatherService.WeatherStatuses.count - 1), y: 0)
         }
     }
}

