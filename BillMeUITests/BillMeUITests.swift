//
//  BillMeUITests.swift
//  BillMeUITests
//
//  Created by Антон Стафеев on 09.09.2022.
//

import XCTest

final class BillMeUITests: XCTestCase {
    var app: XCUIApplication!

    override func setUpWithError() throws {
        app = XCUIApplication()
        app.launch()
        
        continueAfterFailure = false
    }
    
    func test_calculate() {
        
        let addButton = app.buttons["add"]
        addButton.tap()
        addButton.tap()
    
        app.windows.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element(boundBy: 0).children(matching: .textField).element.tap()
        app.keys["5"].tap()
        app.keys["9"].tap()
        app.keys["3"].tap()
        app.keys["0"].tap()

        app.collectionViews.staticTexts["25%"].tap()
        app/*@START_MENU_TOKEN@*/.staticTexts["Посчитать"]/*[[".buttons[\"Посчитать\"].staticTexts[\"Посчитать\"]",".staticTexts[\"Посчитать\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        let result = "1853.12 на человека"
        XCTAssertEqual(app.staticTexts.firstMatch.label, result)
    }
}
