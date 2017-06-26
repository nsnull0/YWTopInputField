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

