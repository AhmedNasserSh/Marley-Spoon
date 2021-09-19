//
//  RecipePresenterMock.swift
//  Marley SpoonTests
//
//  Created by Ahmed Naser on 19/09/2021.
//

import Foundation
@testable import Marley_Spoon

class RecipePresenterMock: RecipeScenePresentationLogic {
    var view: RecipeSceneDisplayView?
    var items: [Recipe] = []
    var didDisplayError = false

    func displayRecipes(items: [Recipe]) {
        self.items = items
    }
    
    func displayError(error: NetworkError) {
        didDisplayError = true
    }
    
    
}
