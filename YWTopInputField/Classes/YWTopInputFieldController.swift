//
//  YWTopInputFieldController.swift
//  YWTopInputField
//
//  Created by Yoseph Wijaya on 2017/06/24.
//  Copyright © 2017 Yoseph Wijaya. All rights reserved.
//

import UIKit

public class YWTopInputFieldController: UIViewController {
    
    @IBOutlet weak var messageLabelYW: UILabel!
    @IBOutlet weak var titleLabelYW: UILabel!
    
    @IBOutlet weak var inputTextContainerYW: UITextView!

    @IBOutlet weak var containerBlur: UIVisualEffectView!
    
    @IBOutlet weak var topContainerBlurConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var accessoryOfYWInputField: UIView!
    
    @IBOutlet weak var inputAcessoryYWInputField: UIVisualEffectView!
    
    @IBOutlet weak var inputAccessoryYWInputFieldPart: UIVisualEffectView!
    
    @IBOutlet weak var bottomConstraintInputYWField: NSLayoutConstraint!
    
    weak var delegate :YWInputProtocol?
    
    private weak var root:UIViewController?
    
    
    private var correctionType:UITextAutocorrectionType = .no
    private var spellCheckType:UITextSpellCheckingType = .no
    private var keyboardType:UIKeyboardType = .default
    private var keyboardAppearance:UIKeyboardAppearance = .default
    
    
    private var containerEffectType:UIBlurEffectStyle = .dark
    private var titleColorText:UIColor = .white
    private var messageColorText:UIColor = .white
    private var titleFontText:UIFont = .boldSystemFont(ofSize: 15.0)
    private var messageFontText:UIFont = .systemFont(ofSize: 12.0)
    
    private var addressTag:Int = 0
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        self.inputTextContainerYW.inputAccessoryView = accessoryOfYWInputField
        self.inputAccessoryYWInputFieldPart.layer.opacity = 0
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
    
    public func setupContainer(_chooseBlurStyleEffectContainer type:UIBlurEffectStyle, _chooseTitleColor colorTitle:UIColor, _chooseMessageColor colorMessage:UIColor, _chooseFontTitle fontTitle:UIFont, _chooseFontMessage fontMessage:UIFont){
        self.containerEffectType = type
        self.titleColorText = colorTitle
        self.messageColorText = colorMessage
        self.titleFontText = fontTitle
        self.messageFontText = fontMessage
    }
    
    //MARK: Animation and Interface
    public func showInput(_withTitle titleStr:String,_andMessage messageStr:String, _withTag tag:Int, completion:@escaping (_ finished:Bool) -> Void){
        self.showInput(completion: completion)
        self.titleLabelYW.text = YWTopInputFieldLogic.checkValidate(_onContent: titleStr, _defaultContent: YWTopInputFieldUtility.titleDefault)
        self.messageLabelYW.text = YWTopInputFieldLogic.checkValidate(_onContent: messageStr, _defaultContent: YWTopInputFieldUtility.messageDefault)
        self.addressTag = tag
        self.delegate?.didShowYWInputField()
    }
    
    public func showInput(_withTitle titleStr:String,_andMessage messageStr:String,_withContentString content:String, _withTag tag:Int  , completion:@escaping (_ finished:Bool) -> Void){
        self.showInput(completion: completion)
        self.titleLabelYW.text = YWTopInputFieldLogic.checkValidate(_onContent: titleStr, _defaultContent: YWTopInputFieldUtility.titleDefault)
        self.messageLabelYW.text = YWTopInputFieldLogic.checkValidate(_onContent: messageStr, _defaultContent: YWTopInputFieldUtility.messageDefault)
        self.inputTextContainerYW.text = content
        self.addressTag = tag
        self.delegate?.didShowYWInputField()
    }
    
    
    public func showInput(_withTitle titleStr:String,_andMessage messageStr:String,_withContentAttributedString content:NSAttributedString, _withTag tag:Int, completion:@escaping (_ finished:Bool) -> Void){
        self.showInput(completion: completion)
        self.titleLabelYW.text = YWTopInputFieldLogic.checkValidate(_onContent: titleStr, _defaultContent: YWTopInputFieldUtility.titleDefault)
        self.messageLabelYW.text = YWTopInputFieldLogic.checkValidate(_onContent: messageStr, _defaultContent: YWTopInputFieldUtility.messageDefault)
        self.inputTextContainerYW.attributedText = content
        self.addressTag = tag
        self.delegate?.didShowYWInputField()
    }
    
    //MARK: Private Animation and Interface implementation
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
        self.view.setupLayoutConstraint_0_0_0_0_toParent()
        
        self.inputTextContainerYW.autocorrectionType = self.correctionType
        self.inputTextContainerYW.keyboardAppearance = self.keyboardAppearance
        self.inputTextContainerYW.spellCheckingType = self.spellCheckType
        self.inputTextContainerYW.keyboardType = self.keyboardType
        
        let visEffect:UIVisualEffectView = UIVisualEffectView(effect: UIBlurEffect(style: self.containerEffectType))
        self.containerBlur.effect = visEffect.effect!
        self.inputAcessoryYWInputField.effect = visEffect.effect!
        self.inputAccessoryYWInputFieldPart.effect = visEffect.effect!
        self.titleLabelYW.textColor = self.titleColorText
        self.messageLabelYW.textColor = self.messageColorText
        self.titleLabelYW.font = self.titleFontText
        self.messageLabelYW.font = self.messageFontText
    }
    
    //MARK: Action Handler
    @IBAction func tapDismiss(_ sender: UITapGestureRecognizer) {
    
        
        self.hideInput(completion: {
            (text:AnyObject, completion) in
            self.delegate?.didCancel()
        })
        
       self.delegate?.didCancel()
        
    }
    
    @IBAction func doneAction(_ sender: UIButton) {
        
        self.hideInput { (text:AnyObject, completion) in
            let toText = text as! String
            self.delegate?.doneAction(resultStr: toText, _withTag: self.addressTag)
        }
        
    }
    
    @IBAction func cancelAction(_ sender: UIButton) {
        
        self.hideInput(completion: {
            (text:AnyObject, completion) in
            self.delegate?.didCancel()
        })
        
    }
    @IBAction func editAttributes(_ sender: UIButton) {
        
        guard self.bottomConstraintInputYWField.constant == -40 else {
            
            UIView.animate(withDuration: 0.3, animations: {
                self.bottomConstraintInputYWField.constant = -40
                self.inputAccessoryYWInputFieldPart.layer.opacity = 0
                self.accessoryOfYWInputField.layoutIfNeeded()
            })
            
            return
        }
        
        UIView.animate(withDuration: 0.3, animations: {
            self.bottomConstraintInputYWField.constant = 0
            self.inputAccessoryYWInputFieldPart.layer.opacity = 1
            self.accessoryOfYWInputField.layoutIfNeeded()
        })
        
    }
    
    
    //MARK: Setup Default
    public override var prefersStatusBarHidden: Bool {
        return true
    }

}





