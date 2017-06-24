//
//  YWTopInputFieldLogic.swift
//  YWTopInputField
//
//  Created by Yoseph Wijaya on 2017/06/25.
//  Copyright © 2017 Yoseph Wijaya. All rights reserved.
//

import UIKit

class YWTopInputFieldLogic {

    
    static func checkValidate(_onContent targetStr:String, _defaultContent content:String) -> String {
        let strProcess = targetStr.replacingOccurrences(of: " ", with: "")
        guard strProcess.characters.count > 0 else {
            return content
        }
        
        return targetStr
    }
    
}
