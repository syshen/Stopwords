//
//  StopwordsTests.swift
//  StopwordsTests
//
//  Created by Shih Yun Shen on 5/11/16.
//  Copyright © 2016 Shih Yun Shen. All rights reserved.
//

import XCTest

class StopwordsTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testClassGet() {
        if let words = Stopwords.get("english") {
            assert(words.count > 0)
        } else {
            assert(false, "fail to read stop words")
        }
    }
    
    func testSubscription() {
        let stop = Stopwords("english")
        assert(stop["the"])
    }
    
    func testSubscription2() {
        let stop = Stopwords("english")
        assert(!stop["function"])
    }
    
    func testLoaded() {
        let stop = Stopwords("chinese") // none existing language
        assert(stop.stopwords == nil)
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock {
            // Put the code you want to measure the time of here.
        }
    }
    
}
