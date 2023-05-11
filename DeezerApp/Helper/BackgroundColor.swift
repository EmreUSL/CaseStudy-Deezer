//
//  BackgroundColor.swift
//  DeezerApp
//
//  Created by emre usul on 11.05.2023.
//

import UIKit

class Background {
    
    static let shared = Background()
    
    func backgroundGradientLayer(_ view: UIView) -> CALayer {
        let colorTop =  UIColor(red: 0/255.0, green: 155.0/255.0, blue: 0.0/255.0, alpha: 1.0).cgColor
        let colorBottom = UIColor(red: 0.0/255.0, green: 0/255.0, blue: 0/255.0, alpha: 1.0).cgColor
                     
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [colorTop,colorBottom]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.frame = view.bounds
        return gradientLayer
    }
    
    func cellGradientLayer(_ view: UIView) -> CALayer {
        let colorTop =  UIColor(red: 0/255.0, green: 155.0/255.0, blue: 0.0/255.0, alpha: 1.0).cgColor
        let colorBottom = UIColor(red: 0/255.0, green: 230/255.0, blue: 230/255.0, alpha: 1.0).cgColor
                     
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [colorTop,colorBottom]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.frame = view.bounds
        return gradientLayer
    }
}


