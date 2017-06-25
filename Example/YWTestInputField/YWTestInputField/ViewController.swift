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
        
        
        alert = YWTopInputFieldController(_contentController: self, _andDelegate: self)
        
        inputText.delegate = self
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func doneAction(resultStr: String) {
        
    }
    
    func didShowYWInputField() {
        
    }
    
    func didDismiss(resultStr: String) {
        self.inputText.text = resultStr
    }
}

extension ViewController:UITextFieldDelegate{
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        
        guard textField != self.inputText else {
            self.alert!.showInput(_withTitle: "", _andMessage: "", _withContentString: textField.text!, completion: {
                (finished) in
                
            })
            return false
        }
        
        return true
        
    }
}
