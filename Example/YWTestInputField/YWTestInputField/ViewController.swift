//
//  ViewController.swift
//  YWTestInputField
//
//  Created by Yoseph Wijaya on 2017/06/24.
//  Copyright © 2017 Yoseph Wijaya. All rights reserved.
//

import UIKit
import YWTopInputField

class ViewController: UIViewController, YWInputProtocol {

    
    var alert:YWTopInputFieldController?
    
    @IBOutlet weak var inputText: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        alert = YWTopInputFieldController(_contentController: self, _withInput: self.inputText, _andDelegate: self)
        
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func doneAction(resultStr: String) {
        
    }
    
    func didShowYWInputField() {
        alert!.showInput(_withTitle: "Information Detail", _andMessage: "", completion: {
            (finished) in
        })
    }
    
}
