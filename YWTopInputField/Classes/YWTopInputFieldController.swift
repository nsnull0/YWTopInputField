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
    
    @IBOutlet weak var inputTextContainerYW: UITextView!

    @IBOutlet weak var containerBlur: UIVisualEffectView!
    
    @IBOutlet weak var topContainerBlurConstraint: NSLayoutConstraint!
    
    weak var delegate :YWInputProtocol?
    
    private weak var root:UIViewController?
    
    private var correctionType:UITextAutocorrectionType = .no
    private var spellCheckType:UITextSpellCheckingType = .no
    private var keyboardType:UIKeyboardType = .default
    private var keyboardAppearance:UIKeyboardAppearance = .default
    
    override public func viewDidLoad() {
        super.viewDidLoad()

        
        
    }
    
    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.topContainerBlurConstraint.constant = -self.getContainerHeight()
        self.view.layoutIfNeeded()
    }

    override public func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    required public init(_contentController parent:UIViewController, _andDelegate delegation:YWInputProtocol) {
        let bundle = Bundle(for: YWTopInputFieldController.self)
        super.init(nibName: "YWMainView", bundle: bundle)
        
        self.root = parent
        
        self.delegate = delegation
        
        self.didMove(toParentViewController: self.root!)
        
    }
    
    
    //MARK: Setup Default Property
    public func setupInputField(_chooseAutoCorrectionType correctionType:UITextAutocorrectionType, _chooseSpellCheckingType spellType:UITextSpellCheckingType, _chooseKeyboardType keyboardType:UIKeyboardType, _chooseKeyboardAppearance keyboardAppearance:UIKeyboardAppearance){
        self.correctionType = correctionType
        self.spellCheckType = spellType
        self.keyboardType = keyboardType
        self.keyboardAppearance = keyboardAppearance
    }
    
    //MARK: Animation and Interface
    public func showInput(_withTitle titleStr:String,_andMessage messageStr:String, completion:@escaping (_ finished:Bool) -> Void){
        self.showInput(completion: completion)
        self.titleLabelYW.text = YWTopInputFieldLogic.checkValidate(_onContent: titleStr, _defaultContent: YWTopInputFieldUtility.titleDefault)
        self.messageLabelYW.text = YWTopInputFieldLogic.checkValidate(_onContent: messageStr, _defaultContent: YWTopInputFieldUtility.messageDefault)
        self.delegate?.didShowYWInputField()
    }
    
    public func showInput(_withTitle titleStr:String,_andMessage messageStr:String,_withContentString content:String  , completion:@escaping (_ finished:Bool) -> Void){
        self.showInput(completion: completion)
        self.titleLabelYW.text = YWTopInputFieldLogic.checkValidate(_onContent: titleStr, _defaultContent: YWTopInputFieldUtility.titleDefault)
        self.messageLabelYW.text = YWTopInputFieldLogic.checkValidate(_onContent: messageStr, _defaultContent: YWTopInputFieldUtility.messageDefault)
        self.inputTextContainerYW.text = content
        self.delegate?.didShowYWInputField()
    }
    
    
    
    public func showInput(_withTitle titleStr:String,_andMessage messageStr:String,_withContentAttributedString content:NSAttributedString, completion:@escaping (_ finished:Bool) -> Void){
        self.showInput(completion: completion)
        self.titleLabelYW.text = YWTopInputFieldLogic.checkValidate(_onContent: titleStr, _defaultContent: YWTopInputFieldUtility.titleDefault)
        self.messageLabelYW.text = YWTopInputFieldLogic.checkValidate(_onContent: messageStr, _defaultContent: YWTopInputFieldUtility.messageDefault)
        self.inputTextContainerYW.attributedText = content
        self.delegate?.didShowYWInputField()
    }
    
    
    func showInput(completion:@escaping (_ finished:Bool) -> Void){
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
    
    func hideInput (completion:@escaping (AnyObject, _ finished:Bool) -> Void){
        
        UIView.animate(withDuration: 0.3, animations: {
            self.topContainerBlurConstraint.constant = -self.getContainerHeight()
            self.view.layoutIfNeeded()
        }) {
           (finished) in
            self.inputTextContainerYW.resignFirstResponder()
            self.view.removeFromSuperview()
            self.removeFromParentViewController()
            completion(self.inputTextContainerYW.text as AnyObject, true)
            
        }
        
    }
    
    func createObject() {
        
        self.root!.view.addSubview(self.view)
        self.view.snp.makeConstraints {
                (make) -> Void in
                make.leading.equalTo(0)
                make.trailing.equalTo(0)
                make.top.equalTo(0)
                make.bottom.equalTo(0)
        }
        
        self.inputTextContainerYW.autocorrectionType = self.correctionType
        self.inputTextContainerYW.keyboardAppearance = self.keyboardAppearance
        self.inputTextContainerYW.spellCheckingType = self.spellCheckType
        self.inputTextContainerYW.keyboardType = self.keyboardType
        
    }
    
    //MARK: Action Handler
    @IBAction func tapDismiss(_ sender: UITapGestureRecognizer) {
        
        self.hideInput { (text:AnyObject, completion) in
            let toText = text as! String
            self.delegate?.didDismiss(resultStr: toText)
        }
        
        
    }
    
    @IBAction func doneAction(_ sender: UIButton) {
        
        self.hideInput { (text:AnyObject, completion) in
            let toText = text as! String
            self.delegate?.didDismiss(resultStr: toText)
        }
        
    }
    
    @IBAction func cancelAction(_ sender: UIButton) {
        
        
    }
    
    
    //MARK: Setup Default
    public override var prefersStatusBarHidden: Bool {
        return true
    }

}





