//
//  YWTopInputFieldLogic.swift
//  YWTopInputField
//
//  Created by Yoseph Wijaya on 2017/06/25.
//  Copyright © 2017 Yoseph Wijaya. All rights reserved.
//

import UIKit

struct propertyVal {
    var correctionType:UITextAutocorrectionType = .no
    var spellCheckType:UITextSpellCheckingType = .no
    var keyboardType:UIKeyboardType = .default
    var keyboardAppearance:UIKeyboardAppearance = .default
    var containerEffectType:UIBlurEffectStyle = .dark
    var titleColorText:UIColor = .white
    var messageColorText:UIColor = .white
    var titleFontText:UIFont = .boldSystemFont(ofSize: 15.0)
    var messageFontText:UIFont = .systemFont(ofSize: 12.0)
    var heightContainerConstraint:CGFloat = 200
}

public class YWTopInputFieldLogic {

    var propertyYW:propertyVal = propertyVal()
    
    public func setCorrectionType(_type:UITextAutocorrectionType) -> YWTopInputFieldLogic {
        
        self.propertyYW.correctionType = _type
        
        return self
    }
    
    public func setSpellCheckType(_type:UITextSpellCheckingType) -> YWTopInputFieldLogic {
        
        self.propertyYW.spellCheckType = _type
        
        return self
        
    }
    
    public func setKeyboardType(_type:UIKeyboardType) -> YWTopInputFieldLogic {
        
        self.propertyYW.keyboardType = _type
        
        return self
    }
    
    public func setKeyboardAppearance(_type:UIKeyboardAppearance) -> YWTopInputFieldLogic {
        
        self.propertyYW.keyboardAppearance = _type
        
        return self
    }
    
    public func setBlurStyleEffectContainer(_type:UIBlurEffectStyle) -> YWTopInputFieldLogic {
        
        self.propertyYW.containerEffectType = _type
        
        return self
    }
    
    public func setTitleColor(_color:UIColor) -> YWTopInputFieldLogic {
        
        self.propertyYW.titleColorText = _color
        
        return self
    }
    
    public func setMessageColor(_color:UIColor) -> YWTopInputFieldLogic {
        
        self.propertyYW.messageColorText = _color
        
        return self
    }
    
    public func setFontTitle(_font:UIFont) -> YWTopInputFieldLogic {
        
        self.propertyYW.titleFontText = _font
        
        return self
    }
    
    public func setMessageFont(_font:UIFont) -> YWTopInputFieldLogic {
        
        self.propertyYW.messageFontText = _font
        
        return self
    }
    
    public func setHeightTextContainer(_height:CGFloat) -> YWTopInputFieldLogic {
        
        guard _height >= 200 else {
            return self
        }
        
        self.propertyYW.heightContainerConstraint = _height
        
        return self
    }
    
    public func validate() {
        
        if self.propertyYW.heightContainerConstraint < 200 {
            self.propertyYW.heightContainerConstraint = 200
        }
        
        
    }
    
    //MARK: Static Function
    static func checkValidate(_onContent targetStr:String, _defaultContent content:String) -> String {
        let strProcess = targetStr.replacingOccurrences(of: " ", with: "")
        guard strProcess.characters.count > 0 else {
            return content
        }
        
        return targetStr
    }
    
    
    
}
