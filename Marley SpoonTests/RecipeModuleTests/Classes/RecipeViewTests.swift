//
//  RecipeViewTests.swift
//  Marley SpoonTests
//
//  Created by Ahmed Naser on 19/09/2021.
//

import XCTest
@testable import Marley_Spoon

class RecipeViewTests: XCTestCase {
    
    var view: RecipeSceneViewController?
    var interactor: RecipeInteractorMock?
    
    override func setUpWithError() throws {
        view = RecipeSceneViewController()
        interactor = RecipeInteractorMock()
        view?.interactor = interactor
    }
    
    override func tearDownWithError() throws {
        view = nil
        interactor = nil
    }
    
    func testInitUI() throws {
        view?.viewDidLoad()
        
        XCTAssertTrue(interactor!.didCallFetchRecipes, "view dosen't call interactor on intilization")
    }
    
    
}
