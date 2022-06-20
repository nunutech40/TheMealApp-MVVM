//
//  UIView+Ext.swift
//  TheMealApp-MVVM-Prodia
//
//  Created by mac on 15/4/22.
//

import UIKit

extension UIView {
    
    var height: CGFloat {
        get {
            return self.frame.size.height
        }

        set(newHeight) {
            var frame = self.frame
            frame.size.height = newHeight
            self.frame = frame
        }
    }
    
}
