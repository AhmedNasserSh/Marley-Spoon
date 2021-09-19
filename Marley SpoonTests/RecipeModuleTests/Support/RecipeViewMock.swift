//
//  RecipeViewMock.swift
//  Marley SpoonTests
//
//  Created by Ahmed Naser on 19/09/2021.
//

import Foundation
@testable import Marley_Spoon

class RecipeViewMock: RecipeSceneDisplayView {
    var interactor: RecipeSceneBusinessLogic?
    
    var router: RecipeSceneRoutingLogic?
    
    var items: [RecipeScene.ViewModel] = []
    var didDisplayError = false
    
    func setRecipes(items: [RecipeScene.ViewModel]) {
        self.items = items
    }
    
    func displayError(error: NetworkError) {
        self.didDisplayError = true
    }
    
    
}
