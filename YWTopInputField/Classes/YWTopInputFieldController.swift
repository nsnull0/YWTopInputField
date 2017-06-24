//
//  YWTopInputFieldController.swift
//  YWTopInputField
//
//  Created by Yoseph Wijaya on 2017/06/24.
//  Copyright © 2017 Yoseph Wijaya. All rights reserved.
//

import UIKit
import SnapKit

public class YWTopInputFieldController: UIViewController {
    
    @IBOutlet weak var messageLabelYW: UILabel!
    @IBOutlet weak var titleLabelYW: UILabel!
    
    @IBOutlet weak var inputTextContainerYW: UITextField!

    @IBOutlet weak var containerBlur: UIVisualEffectView!
    
    @IBOutlet weak var topContainerBlurConstraint: NSLayoutConstraint!
    
    weak var delegate :YWInputProtocol?
    
    private weak var root:UIViewController?
    weak var inputTextField:UITextField?
    weak var inputTextView:UITextView?
    
    
    override public func viewDidLoad() {
        super.viewDidLoad()

        
        
    }
    
    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.topContainerBlurConstraint.constant = -self.getContainerHeight()
        self.view.layoutIfNeeded()
        self.inputTextContainerYW.delegate = self
    }

    override public func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    required public init(_contentController parent:UIViewController,_withInput inputField:UITextField, _andDelegate delegation:YWInputProtocol) {
        let bundle = Bundle(for: YWTopInputFieldController.self)
        super.init(nibName: "YWMainView", bundle: bundle)
        
        self.root = parent
        self.inputTextField = inputField
        self.inputTextField!.delegate = self
        
        
        self.delegate = delegation
        
    }
    
    
    //MARK: Animation and Interface
    public func showInput(_withTitle titleStr:String,_andMessage messageStr:String, completion:@escaping (_ finished:Bool) -> Void){
        self.showInput(completion: completion)
        self.titleLabelYW.text = YWTopInputFieldLogic.checkValidate(_onContent: titleStr, _defaultContent: YWTopInputFieldUtility.titleDefault)
        self.messageLabelYW.text = YWTopInputFieldLogic.checkValidate(_onContent: messageStr, _defaultContent: YWTopInputFieldUtility.messageDefault)
    }
    
    public func showInput(completion:@escaping (_ finished:Bool) -> Void){
        guard self.root != nil else {
            completion(false)
            return
        }
        
        self.createObject()
        UIView.animate(withDuration: 0.3, animations: {
            self.topContainerBlurConstraint.constant = 0
            self.view.layoutIfNeeded()
        }) {
            (finished) in
            
            self.inputTextContainerYW.becomeFirstResponder()
            
            completion(true)
        }
    }
    
    public func hideInput (){
        UIView.animate(withDuration: 0.3, animations: {
            self.topContainerBlurConstraint.constant = -self.getContainerHeight()
            self.view.layoutIfNeeded()
        }) {
           (finished) in
            
            self.view.removeFromSuperview()
            self.removeFromParentViewController()
        }
        
    }
    
    func createObject() {
        self.didMove(toParentViewController: self.root!)
        self.root!.view.addSubview(self.view)
        self.view.snp.makeConstraints {
                (make) -> Void in
                make.leading.equalTo(0)
                make.trailing.equalTo(0)
                make.top.equalTo(0)
                make.bottom.equalTo(0)
        }
        
        
        
        
        
        
    }
    
    //MARK: Action Handler
    @IBAction func tapDismiss(_ sender: UITapGestureRecognizer) {
        
        self.hideInput()
        
    }
    
    @IBAction func doneAction(_ sender: UIButton) {
        
        
    }
    
    @IBAction func cancelAction(_ sender: UIButton) {
        
        
    }
    
    
    //MARK: Setup Default
    public override var prefersStatusBarHidden: Bool {
        return true
    }

}


extension YWTopInputFieldController:UITextFieldDelegate{
    
    public func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        
        
        guard textField != self.inputTextField else {
            self.inputTextField?.resignFirstResponder()
            self.delegate?.didShowYWInputField()
            return false
        }
        
        
        return true
    }
    
}

