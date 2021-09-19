//
//  RecipesPresenterTests.swift
//  Marley SpoonTests
//
//  Created by Ahmed Naser on 19/09/2021.
//

import XCTest
@testable import Marley_Spoon

class RecipesPresenterTests: XCTestCase {

    var presenter: RecipeScenePresenter?
    var view: RecipeViewMock?
    
    override func setUpWithError() throws {
        view = RecipeViewMock()
        presenter = RecipeScenePresenter(view: view!)
        
    }

    override func tearDownWithError() throws {
        view = nil
        presenter = nil
    }

    func testMapRecipes() {
        let expectation = self.expectation(description: "testMapRecipes")
        RecipeServiceMock().getRecipes(limit: 1, skip: 0) { result in
            switch result {
            case .success(let data):
                self.presenter?.displayRecipes(items: data)
                expectation.fulfill()
                XCTAssertTrue(self.view!.items.count  > 0, "Presenter doesn't display View")
                XCTAssertEqual(self.view!.items[0].title, "White Cheddar Grilled Cheese",
                               "Presenter dosen't map to View data")
            case .failure:break
            }
        }
        wait(for: [expectation], timeout: 5)
    }

}
