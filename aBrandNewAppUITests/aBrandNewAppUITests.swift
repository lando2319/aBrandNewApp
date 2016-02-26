//
//  aBrandNewAppUITests.swift
//  aBrandNewAppUITests
//
//  Created by MIKE LAND on 12/10/15.
//  Copyright © 2015 MIKE LAND. All rights reserved.
//

import XCTest

class aBrandNewAppUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    
    
    
    
    var fieldLost:Bool = false
    var fieldWon:Bool = false
    var fieldWonDouble:Bool = false
    var fieldWonTriple:Bool = false
    
    var fieldActualConfirmed:Bool = false
    
    var diceAre:Int = 2
    
    let allRolls:[Int] = [2,3,4,5,6,7,8,9,10,11,12]
    
    func testExample() {
        let app = XCUIApplication()
        
        func tapNow() {
            app.toolbars.buttons["Tip2"].tap()
            self.checkTheRoll(app)
            self.evaluateTheField(app)
            
            // comment out to have it run indefinitly
//            if !fieldActualConfirmed {
                tapNow()
//            }
        }
        
        tapNow()
    }
    
    func evaluateTheField(app:XCUIApplication) {
        
        func itWon() {
            XCTAssertNotNil(app.staticTexts["WON"])
            
        }
        
        func itLost() {
            XCTAssertNotNil(app.staticTexts["LOST"])
        }
        
        switch self.diceAre {
        case 2:
            self.fieldWonDouble = true
            itWon()
        case 3, 4, 9, 10, 11:
            itWon()
            self.fieldWon = true
        case 5, 6, 7, 8:
            itLost()
            self.fieldLost = true
        case 12:
            itWon()
            self.fieldWonTriple = true
        default:
            break
        }
        
        if self.fieldLost && self.fieldWon && self.fieldWonDouble && self.fieldWonTriple {
            self.fieldActualConfirmed = true
        }
    }
    
    
    func checkTheRoll(app:XCUIApplication) {
        for roll in self.allRolls {
            if app.staticTexts[String(roll)].exists {
                self.diceAre = roll
                break
                // need to extract die one and die two
            }
        }
    }
}
