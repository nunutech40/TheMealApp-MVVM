//
//  UIColor+TMA.swift
//  TheMealApp-MVVM-Prodia
//
//  Created by mac on 8/4/22.
//

import UIKit

extension UIColor {
    
    public class var mainColor: UIColor {
        guard let color = UIColor(named: "mainColor") else {
            return UIColor.RGBColor(red: 53, green: 70, blue: 255)
        }
        return color
    }
    
}

extension UIColor {
    
    static func RGBColor(red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) -> UIColor {
        return UIColor(red: red/255.0, green: green/255.0, blue: blue/255.0, alpha: alpha)
    }
    
    static func RGBColor(red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor {
        return RGBColor(red: red, green: green, blue: blue, alpha: 1)
    }
}


