//
//  YWExtension++.swift
//  YWTopInputField
//
//  Created by Yoseph Wijaya on 2017/06/24.
//  Copyright © 2017 Yoseph Wijaya. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController{
    
    func getScreenWidth() -> CGFloat {
        return UIScreen.main.bounds.size.width
    }
    
    func getContainerHeight() -> CGFloat {
        return UIScreen.main.bounds.size.height / 5 * 2
    }
    
}

extension UIView{
    
    func setupLayoutConstraint_0_0_0_0_toParent() {
        
        self.translatesAutoresizingMaskIntoConstraints = false
        
        let topConstraint:NSLayoutConstraint = NSLayoutConstraint(item: self, attribute: .top, relatedBy: .equal, toItem: self.superview!, attribute: .topMargin, multiplier: 1.0, constant: 0.0)
        topConstraint.isActive = true
        
        let leftConstraint:NSLayoutConstraint = NSLayoutConstraint(item: self, attribute: .leading, relatedBy: .equal, toItem: self.superview!, attribute: .leading, multiplier: 1.0, constant: 0.0)
        leftConstraint.isActive = true
        
        let rightConstraint:NSLayoutConstraint = NSLayoutConstraint(item: self, attribute: .trailing, relatedBy: .equal, toItem: self.superview!, attribute: .trailing, multiplier: 1.0, constant: 0.0)
        rightConstraint.isActive = true
        
        let bottomConstraint:NSLayoutConstraint = NSLayoutConstraint(item: self, attribute: .bottom, relatedBy: .equal, toItem: self.superview!, attribute: .bottomMargin, multiplier: 1.0, constant: 0.0)
        bottomConstraint.isActive = true
        
        self.superview!.removeConstraint(topConstraint)
        self.superview!.removeConstraint(leftConstraint)
        self.superview!.removeConstraint(rightConstraint)
        self.superview!.removeConstraint(bottomConstraint)
        
        self.superview!.addConstraint(topConstraint)
        self.superview!.addConstraint(leftConstraint)
        self.superview!.addConstraint(rightConstraint)
        self.superview!.addConstraint(bottomConstraint)
    }
    
    
    
}

extension UIButton{
    
    var borderColoring:UIColor {
        set{
            self.layer.borderColor = newValue.cgColor
            self.layer.borderWidth = 1
        }
        
        get{
            return UIColor(cgColor: self.layer.borderColor!)
        }
    }
    
    var cornerRadiuser:CGFloat {
        set {
            self.layer.cornerRadius = newValue
            self.layer.masksToBounds = true
        }
        get {
            return self.layer.cornerRadius
        }
    }
    
}

