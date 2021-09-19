//
//  RecipeDetailsModuleUITests.swift
//  Marley SpoonUITests
//
//  Created by Ahmed Naser on 19/09/2021.
//

import XCTest

class RecipeDetailsModuleUITests: XCTestCase {
    var app: XCUIApplication?

    override func setUpWithError() throws {
        app = XCUIApplication()
        app?.launch()
        continueAfterFailure = false

    }

    override func tearDownWithError() throws {
        app = nil
    }

    func testshowDetails() throws {
        XCUIApplication().collectionViews.children(matching: .cell).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element.tap()
  
        let recipeImage = app?.images.element(matching: .image,
                                              identifier: AccessibilityIdsReference
                                                .RecipeSceneSceneIds
                                                .recipeSceneDetailsImageViewIdentifier
                                                .rawValue)
        
        let recipeTitleLabel = app?.staticTexts.element(matching: .staticText,
                                                        identifier:AccessibilityIdsReference
                                                            .RecipeSceneSceneIds
                                                            .recipeSceneDetailsTitleLabelIdentifier
                                                            .rawValue)
        
        
        let recipeSubTitleLabel = app?.staticTexts.element(matching: .any,
                                                           identifier:AccessibilityIdsReference
                                                            .RecipeSceneSceneIds
                                                            .recipeSceneDetailsSubTitleLabelIdentifier
                                                            .rawValue)
        
        XCTAssertTrue(recipeImage!.waitForExistence(timeout: 5), "recipe image doesn't load")
        XCTAssertTrue(recipeTitleLabel!.waitForExistence(timeout: 5), "recipe title label doesn't load")
        XCTAssertTrue(recipeSubTitleLabel!.waitForExistence(timeout: 5), "recipe subtitle label doesn't load")
    }

}
