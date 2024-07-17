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
    
    
    let scrollView = UIScrollView()
    let contentView = UIView()
    let itemWidth: CGFloat = 150.0
    let colors: [UIColor] = [.red, .green, .blue, .yellow, .purple]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupScrollView()
        setupContentView()
        addContentToScrollView()
        
    }
    
    func setupScrollView() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.delegate = self
        scrollView.showsHorizontalScrollIndicator = false
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
        //let colors: [UIColor] = [.red, .green, .blue, .yellow, .purple]
        var previousView: UIView? = nil
        
        for i in 0..<colors.count {
            let view = UIView()
            view.backgroundColor = colors[i]
            view.layer.borderWidth = 1.0
            view.layer.borderColor = UIColor.black.cgColor
            view.translatesAutoresizingMaskIntoConstraints = false
            contentView.addSubview(view)
            
            NSLayoutConstraint.activate([
                view.topAnchor.constraint(equalTo: contentView.topAnchor),
                view.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
                view.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
            ])
            
            if let previousView = previousView {
                view.leadingAnchor.constraint(equalTo: previousView.trailingAnchor).isActive = true
            } else {
                view.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
            }
            
            previousView = view
        }
        
        if let previousView = previousView {
            previousView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        }
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let pageWidth = scrollView.bounds.width
        let targetXContentOffset = targetContentOffset.pointee.x
        let contentWidth = scrollView.contentSize.width
        
        var newPage = round(targetXContentOffset / pageWidth)
        
        if newPage < 0 {
            newPage = 0
        } else if newPage > (contentWidth / pageWidth) {
            newPage = floor(contentWidth / pageWidth)
        }
        
        targetContentOffset.pointee.x = newPage * pageWidth
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let contentOffsetX = scrollView.contentOffset.x
        let pageWidth = scrollView.bounds.width
        let page = Int(contentOffsetX / pageWidth)
        
        if page >= 0 && page < colors.count - 1 {
            let progress = (contentOffsetX - (CGFloat(page) * pageWidth)) / pageWidth
            view.backgroundColor = blend(from: colors[page], to: colors[page + 1], progress: progress)
        }
    }
    
    func blend(from color1: UIColor, to color2: UIColor, progress: CGFloat) -> UIColor {
        var (r1, g1, b1, a1): (CGFloat, CGFloat, CGFloat, CGFloat) = (0, 0, 0, 0)
        var (r2, g2, b2, a2): (CGFloat, CGFloat, CGFloat, CGFloat) = (0, 0, 0, 0)
        
        color1.getRed(&r1, green: &g1, blue: &b1, alpha: &a1)
        color2.getRed(&r2, green: &g2, blue: &b2, alpha: &a2)
        
        let r = r1 + (r2 - r1) * progress
        let g = g1 + (g2 - g1) * progress
        let b = b1 + (b2 - b1) * progress
        let a = a1 + (a2 - a1) * progress
        
        return UIColor(red: r, green: g, blue: b, alpha: a)
    }
}

