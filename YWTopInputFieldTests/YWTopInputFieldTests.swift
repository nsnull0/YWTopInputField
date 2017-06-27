//
//  YWTopInputFieldTests.swift
//  YWTopInputFieldTests
//
//  Created by Yoseph Wijaya on 2017/06/22.
//  Copyright © 2017 Yoseph Wijaya. All rights reserved.
//

import XCTest
@testable import YWTopInputField

class YWTopInputFieldTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    
    func testInputTitleAndMessage() {
        var title:String = YWTopInputFieldLogic.checkValidate(_onContent: "   ", _defaultContent: YWTopInputFieldUtility.titleDefault)
        
        XCTAssertEqual(title, YWTopInputFieldUtility.titleDefault)
        
        title = YWTopInputFieldLogic.checkValidate(_onContent: "boom", _defaultContent: YWTopInputFieldUtility.titleDefault)
        
        XCTAssertEqual(title, "boom")
        
    }
    
    func testSetupUIViewConstraints()  {
        let parentView:UIView = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        let childView:UIView = UIView(frame: CGRect(x: 0, y: 0, width: 80, height: 80))
        
        parentView.addSubview(childView)
        
        XCTAssertEqual(parentView.constraints.count, 0)
        
        childView.setupLayoutConstraint_0_0_0_0_toParent()
        
        XCTAssertEqual(parentView.constraints.count, 4)
        
        childView.removeFromSuperview()
        parentView.addSubview(childView)
        
        childView.setupLayoutConstraint_0_0_0_0_toParent()
        
        XCTAssertEqual(parentView.constraints.count, 4)
        
        childView.removeFromSuperview()
        parentView.addSubview(childView)
        
        childView.setupLayoutConstraint_0_0_0_0_toParent()
        
        XCTAssertEqual(parentView.constraints.count, 4)
        
    }
    
}
