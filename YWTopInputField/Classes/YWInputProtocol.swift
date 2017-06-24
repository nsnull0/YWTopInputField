//
//  YWInputProtocol.swift
//  YWTopInputField
//
//  Created by Yoseph Wijaya on 2017/06/24.
//  Copyright © 2017 Yoseph Wijaya. All rights reserved.
//

import UIKit

public protocol YWInputProtocol: class {
    
    func doneAction(resultStr: String)
    
    func didShowYWInputField()
}
