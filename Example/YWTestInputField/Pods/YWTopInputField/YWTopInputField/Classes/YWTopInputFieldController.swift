//
//  YWTopInputFieldController.swift
//  YWTopInputField
//
//  Created by Yoseph Wijaya on 2017/06/24.
//  Copyright © 2017 Yoseph Wijaya. All rights reserved.
//

import UIKit

public class YWTopInputFieldController: UIViewController {

    @IBOutlet public weak var containerBlur: UIVisualEffectView!
    
    @IBOutlet weak var topContainerBlurConstraint: NSLayoutConstraint!
    
    private weak var delegate :YWInputProtocol?
    
    override public func viewDidLoad() {
        super.viewDidLoad()

        
        
        // Do any additional setup after loading the view.
    }

    override public func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
  
    
    public init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?, delegate:YWInputProtocol) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        self.delegate = delegate
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    
    required public init() {
        let bundle = Bundle(for: YWTopInputFieldController.self)
        super.init(nibName: nil, bundle: bundle)
        
        
        
        
    }
    
    
    //MARK: Animation and Interface
    public func showInput(){
        UIView.animate(withDuration: 0.3, animations: {
            self.topContainerBlurConstraint.constant = 0
            self.view.layoutIfNeeded()
        })
    }
    
    public func hideInput (){
    
        UIView.animate(withDuration: 0.3, animations: {
            self.topContainerBlurConstraint.constant = -150
            self.view.layoutIfNeeded()
        })
    }

}
