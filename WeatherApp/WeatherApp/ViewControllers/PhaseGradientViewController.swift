//
//  PhaseGradientViewController.swift
//  WeatherApp
//
//  Created by Vasya Smetankin on 18.07.2024.
//

import UIKit

class PhaseGradientViewController: UIViewController {
    let animatedView = UIView()
    let phaseGradientLayer1 = CAGradientLayer()
    let phaseGradientLayer2 = CAGradientLayer()
    let skyGradientLayer = CAGradientLayer()
    let blurEffectView = UIVisualEffectView(effect: UIBlurEffect(style: .light))
    var isLayer1Active = true
    var currentPhaseIndex = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        setupGradientLayer()
    }
    
    func setupGradientLayer() {
        animatedView.frame = view.bounds
        view.addSubview(animatedView)
        // lower sky level
        skyGradientLayer.frame = view.bounds
        skyGradientLayer.colors = [
            UIColor(red: 135/255, green: 206/255, blue: 235/255, alpha: 1).cgColor,
            UIColor.white.cgColor
        ]
        skyGradientLayer.startPoint = CGPoint(x: 1, y: 0)
        skyGradientLayer.endPoint = CGPoint(x: 1, y: 1.2)
        animatedView.layer.addSublayer(skyGradientLayer)
        // upper layer
        setupPhaseGradientLayer(phaseGradientLayer1)
        setupPhaseGradientLayer(phaseGradientLayer2)
        animatedView.layer.addSublayer(phaseGradientLayer1)
        animatedView.layer.addSublayer(phaseGradientLayer2)
        phaseGradientLayer1.opacity = 1.0
        phaseGradientLayer2.opacity = 0.0
        // blur
        blurEffectView.frame = animatedView.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        animatedView.addSubview(blurEffectView)
    }
    
    func setupPhaseGradientLayer(_ layer: CAGradientLayer) {
        layer.frame = view.bounds
        layer.startPoint = CGPoint(x: 1, y: 0)
        layer.endPoint = CGPoint(x: 1, y: 0.3)
        layer.colors = [UIColor.clear.cgColor, UIColor.clear.cgColor]
    }
    
    func startPhaseTransition(to colors: [UIColor]) {
        let transparentColor = colors.last?.withAlphaComponent(0) ?? UIColor.clear
        let targetLayer = isLayer1Active ? phaseGradientLayer2 : phaseGradientLayer1
        targetLayer.colors = colors.map { $0.cgColor } + [transparentColor.cgColor]
        let fadeOutAnimation = CABasicAnimation(keyPath: "opacity")
        fadeOutAnimation.fromValue = 1.0
        fadeOutAnimation.toValue = 0.0
        fadeOutAnimation.duration = 1.0
        fadeOutAnimation.fillMode = .forwards
        fadeOutAnimation.isRemovedOnCompletion = false
        let fadeInAnimation = CABasicAnimation(keyPath: "opacity")
        fadeInAnimation.fromValue = 0.0
        fadeInAnimation.toValue = 1.0
        fadeInAnimation.duration = 1.0
        fadeInAnimation.fillMode = .forwards
        fadeInAnimation.isRemovedOnCompletion = false
        let activeLayer = isLayer1Active ? phaseGradientLayer1 : phaseGradientLayer2
        activeLayer.add(fadeOutAnimation, forKey: "fadeOut")
        targetLayer.add(fadeInAnimation, forKey: "fadeIn")
        isLayer1Active.toggle()
    }
}

