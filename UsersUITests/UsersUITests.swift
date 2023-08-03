//
//  UsersUITests.swift
//  UsersUITests
//
//  Created by Juan Camilo Marín Ochoa on 2/08/23.
//

import XCTest

final class UsersUITests: XCTestCase {
    private var app: XCUIApplication!
    
    override func setUpWithError() throws {
        continueAfterFailure = false
        
        app = XCUIApplication()
        app.launch()
    }
    
    override func tearDownWithError() throws {
        app = nil
    }
    
    func testComplex() {
        sleep(2)
        
        app.swipeUp()
        app.swipeDown()
        
        let searchField = app.searchFields["Buscar usuario"]
        XCTAssertTrue(searchField.exists)
                
        searchField.tap()
        sleep(1)
        searchField.typeText("Glenna")
        
        sleep(1)
        
        let viewPosts = app.buttons["VER PUBLICACIONES"]
        XCTAssertTrue(viewPosts.exists)
        
        sleep(1)
        
        app.swipeUp()
        app.swipeDown()
        
        app.navigationBars.buttons.element(boundBy: 0).tap()
        
        searchField.tap()
        sleep(1)
        searchField.typeText("Clementine")
        
        searchField.doubleTap()
        app.keys["delete"].tap()
        
        searchField.tap()
        searchField.typeText("Clementine")
    }
    
    func testFieldSearch() {
        let searchField = app.searchFields["Buscar usuario"]
        XCTAssertTrue(searchField.exists)
        
        searchField.tap()
        searchField.typeText("Ervin Howell")
    }
    
    func testNavigation() {
        sleep(1)
        
        let viewPosts = app.buttons["VER PUBLICACIONES"].firstMatch
        XCTAssertTrue(viewPosts.exists)
        viewPosts.tap()
    }
}
