//
//  ViewController.swift
//  YWTestInputField
//
//  Created by Yoseph Wijaya on 2017/06/24.
//  Copyright © 2017 Yoseph Wijaya. All rights reserved.
//

import UIKit
import YWTopInputField

enum tagIdentity:Int {
    case textFieldTag
    case textViewTag
    case labelTag
}

class ViewController: UIViewController, YWInputProtocol {

    
    var alert:YWTopInputFieldController?
    
    
    
    @IBOutlet weak var inputTextView: UITextView!
    @IBOutlet weak var inputText: UITextField!
    @IBOutlet weak var inputLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        alert = YWTopInputFieldController(_contentController: self, _andDelegate: self)
        
        //Optional, it will setup to Default setting
        //Change to Builder type, you could set 1 or more parameter at once. and don't forget to call validate() so your parameter is in correct state
        alert!.customize.setCorrectionType(_type: .no)
                        .setSpellCheckType(_type: .no)
                        .setKeyboardType(_type: .default)
                        .setKeyboardAppearance(_type: .alert)
                        .setBlurStyleEffectContainer(_type: .dark)
                        .setTitleColor(_color: .white)
                        .setMessageColor(_color: .white)
                        .setFontTitle(_font: .boldSystemFont(ofSize: 15.0))
                        .setMessageFont(_font: .systemFont(ofSize: 12.0))
                        .setHeightTextContainer(_height: 400)
                        .validate()
        
        
        inputText.delegate = self
        inputTextView.delegate = self
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func didShowYWInputField() {
        
    }
    
    func doneAction(resultStr: String, _withTag: Int) {
        
        switch _withTag {
        case tagIdentity.labelTag.rawValue:
            self.inputLabel.text = resultStr
            break
        case tagIdentity.textViewTag.rawValue:
            self.inputTextView.text = resultStr
            break
        case tagIdentity.textFieldTag.rawValue:
            self.inputText.text = resultStr
            break
        default:
            break
        }
    }
    
    func didCancel() {
        
    }
    
    @IBAction func EditLabelTouchUp(_ sender: UIButton) {
        self.alert!.showInput(_withTitle: "", _andMessage: "", _withContentString: self.inputLabel.text!, _withTag: tagIdentity.labelTag.rawValue, completion: {
            (finished) in
            
        })
    }
    
}

extension ViewController:UITextFieldDelegate{
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        
        guard textField != self.inputText else {
            self.alert!.customize.setKeyboardType(_type: .numberPad).validate()
            self.alert!.showInput(_withTitle: "", _andMessage: "", _withContentString: textField.text!, _withTag: tagIdentity.textFieldTag.rawValue, completion: {
                (finished) in
                
            })
            return false
        }
        
        return true
        
    }
    
    
}

extension ViewController:UITextViewDelegate{
    func textViewShouldBeginEditing(_ textView: UITextView) -> Bool {
        guard textView != self.inputTextView else {
            self.alert!.showInput(_withTitle: "TextView Boom", _andMessage: "", _withContentString: textView.text!, _withTag: tagIdentity.textViewTag.rawValue, completion: {
                (finished) in
                
            })
            return false
        }
        
        return true
    }
}
