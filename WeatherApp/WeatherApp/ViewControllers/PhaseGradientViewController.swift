//
//  PhaseGradientViewController.swift
//  WeatherApp
//
//  Created by Vasya Smetankin on 18.07.2024.
//

import UIKit

class PhaseGradientViewController: UIViewController {
    
    let animatedView = UIView()
    let phaseGradientLayer = CAGradientLayer()
    let skyGradientLayer = CAGradientLayer()
    
    let phases: [UIColor] = [.blue, .red, .green, .orange, .yellow, .purple, .systemMint, .systemPink]
    var currentPhaseIndex = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        setupGradientLayer()
        startPhaseAnimation()
    }
    
    func setupGradientLayer() {
        animatedView.frame = view.bounds
        view.addSubview(animatedView)
        
        // lower layer
        skyGradientLayer.frame = view.bounds
        skyGradientLayer.colors = [
            UIColor(red: 135/255, green: 206/255, blue: 235/255, alpha: 1).cgColor,
            UIColor.white.cgColor
        ]
        skyGradientLayer.startPoint = CGPoint(x: 0.5, y: 0)
        skyGradientLayer.endPoint = CGPoint(x: 2, y: 2)
        animatedView.layer.addSublayer(skyGradientLayer)
        
        // upper layer
        phaseGradientLayer.frame = view.bounds
        phaseGradientLayer.startPoint = CGPoint(x: 1, y: 0)
        phaseGradientLayer.endPoint = CGPoint(x: 1, y: 0.5)
        updateGradientColors()
        animatedView.layer.addSublayer(phaseGradientLayer)
    }
    
    func startPhaseAnimation() {
        let animator = UIViewPropertyAnimator(duration: 3.0, curve: .easeInOut) {
            self.updateGradientColors()
        }
        
        animator.addCompletion { position in
            if position == .end {
                self.startPhaseAnimation()
            }
        }
        
        animator.startAnimation()
    }
    
    func updateGradientColors() {
        let currentColor = phases[currentPhaseIndex]
        let transparentColor = currentColor.withAlphaComponent(0)
        phaseGradientLayer.colors = [currentColor.cgColor, transparentColor.cgColor]
        currentPhaseIndex = (currentPhaseIndex + 1) % phases.count
    }
}
