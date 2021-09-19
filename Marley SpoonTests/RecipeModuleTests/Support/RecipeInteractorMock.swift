//
//  RecipeInteractorMock.swift
//  Marley SpoonTests
//
//  Created by Ahmed Naser on 19/09/2021.
//

import Foundation
@testable import Marley_Spoon

class RecipeInteractorMock: RecipeSceneBusinessLogic {
    var presenter: RecipeScenePresentationLogic
    
    var worker: RecipeSceneWorkerType
    var didCallFetchRecipes  = false
    var didCallNewRecipes  = false

    init() {
        presenter = RecipePresenterMock()
        worker = RecipeWorker(service: RecipeServiceMock())
    }
    
    func getRecipes() {
        didCallFetchRecipes = true
    }
    
    func getNewRecipes(currentIndex: Int) {
        didCallNewRecipes = true
    }
    
    
}
