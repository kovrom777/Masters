//
//  ButtonExtension.swift
//  AVSoft
//
//  Created by Роман Ковайкин on 16.06.2020.
//  Copyright © 2020 Роман Ковайкин. All rights reserved.
//

import Foundation
import UIKit

extension UIButton {
    
    func setGradientBackground(colorTop: UIColor, colorBottom: UIColor) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [colorBottom.cgColor, colorTop.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1.0 , y: 0.5)
        gradientLayer.cornerRadius = 16
        gradientLayer.locations = [0, 1]
        gradientLayer.frame = bounds
       layer.insertSublayer(gradientLayer, at: 0)
    }
    
    func setGradientBorder(title:String, startColor:UIColor, endColor:UIColor) {
        let button:UIButton = UIButton(frame: self.bounds)
        button.setTitle(title, for: .normal)
        button.titleLabel?.font = UIFont(name: "OpenSans-SemiBold", size: 20)
        
        let gradient = CAGradientLayer()
        gradient.colors = [startColor.cgColor, endColor.cgColor]
        gradient.startPoint = CGPoint(x: 0.0, y: 0.5)
        gradient.endPoint = CGPoint(x: 1.0, y: 0.5)
        gradient.frame = self.bounds
        self.layer.insertSublayer(gradient, at: 0)
        self.mask = button

        button.layer.cornerRadius = 16
        button.layer.borderWidth = 4.0
    }
    
        
}

