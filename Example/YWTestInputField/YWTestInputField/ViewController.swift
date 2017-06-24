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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let bundle = Bundle(for: YWTopInputFieldController.self)
        let storyBoard = UIStoryboard(name: "YWMain", bundle: bundle)
        
        alert = storyBoard.instantiateInitialViewController() as? YWTopInputFieldController
        
        self.didMove(toParentViewController: alert)
        alert!.view.backgroundColor = UIColor.clear
        self.view.addSubview(alert!.view)
        
        self.perform(#selector(test), with: self, afterDelay: 1)
        
    }

    @objc func test(){
        alert!.showInput()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func doneAction(resultStr: String) {
        
    }
}

