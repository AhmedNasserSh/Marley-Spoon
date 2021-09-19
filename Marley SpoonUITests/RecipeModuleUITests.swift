//
//  RecipeModuleUITests.swift
//  Marley SpoonUITests
//
//  Created by Ahmed Naser on 19/09/2021.
//

import XCTest

class RecipeModuleUITests: XCTestCase {
    var app: XCUIApplication?
    
    override func setUpWithError() throws {
        app = XCUIApplication()
        app?.launch()
        continueAfterFailure = false
    }
    
    override func tearDownWithError() throws {
        app = nil
    }
    
    
    
    func testFetchData() throws {
        let firstCell =  app?.collectionViews.cells.children(matching: .any).element(boundBy: 0)
        
        let recipeImage = firstCell?.children(matching: .other)
            .element
            .children(matching: .image)
            .element(matching: .image
                     , identifier: AccessibilityIdsReference
                        .RecipeSceneIds
                        .recipeImageViewIdentifier
                        .rawValue
            )
        
        let recipeTitleLabel = app?.staticTexts.element(matching: .staticText,
                                                        identifier:AccessibilityIdsReference
                                                            .RecipeSceneIds
                                                            .recipeTitleLabelIdentifier
                                                            .rawValue)
        
        
        let recipeSubTitleLabel = app?.staticTexts.element(matching: .any,
                                                           identifier:AccessibilityIdsReference
                                                            .RecipeSceneIds
                                                            .recipeSubTitleLabelIdentifier
                                                            .rawValue)
        
        
        XCTAssertTrue(recipeImage!.waitForExistence(timeout: 5), "cell image doesn't load")
        XCTAssertTrue(recipeTitleLabel!.waitForExistence(timeout: 5), "cell title label doesn't load")
        XCTAssertTrue(recipeSubTitleLabel!.waitForExistence(timeout: 5), "cell subtitle label doesn't load")
        
    }
    
    
    
}
