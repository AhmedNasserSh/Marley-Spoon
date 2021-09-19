//
//  RecipesInteractorTests.swift
//  Marley SpoonTests
//
//  Created by Ahmed Naser on 19/09/2021.
//

import XCTest
@testable import Marley_Spoon

class RecipesInteractorTests: XCTestCase {
    var interactor: RecipeSceneInteractor?
    var presenterMock: RecipePresenterMock?
    var workerMock: RecipeSceneWorkerType?

    override func setUpWithError() throws {
        presenterMock = RecipePresenterMock()
        workerMock = RecipeWorker(service: RecipeServiceMock())

        presenterMock?.view = RecipeViewMock()
        interactor = RecipeSceneInteractor(presenter: presenterMock!, worker: workerMock!, limit: 2)
    }

    override func tearDownWithError() throws {
        interactor = nil
        presenterMock = nil
        workerMock = nil
    }

    func testFetchRecipes() throws {
        // fetch recipes
        interactor?.getRecipes()
        XCTAssertTrue(presenterMock!.items.count > 0, "Interactor doesn't Fetch charcter correctly")
    }
    
    func testFetchNewItems() throws {
        //fetch recipes first
        interactor?.getRecipes()
        // try to fetch new recipes
        interactor?.getNewRecipes(currentIndex: 0)
        XCTAssertTrue(presenterMock!.items.count == 4, "Interactor doesn't Fetch charcter correctly")
    }

    func testNotFetchNewItems() throws {
        //fetch recipes first
        interactor?.getRecipes()
        // try to fetch new recipes mock scrolling behaviour
        interactor?.getNewRecipes(currentIndex: 0)
        interactor?.getNewRecipes(currentIndex: 0)
        interactor?.getNewRecipes(currentIndex: 0)

        XCTAssertTrue(presenterMock!.items.count == 4, "Interactor doesn't Fetch charcter correctly")
    }
}
