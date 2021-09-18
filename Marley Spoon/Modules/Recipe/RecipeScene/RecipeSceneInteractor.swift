//
//  RecipeSceneInteractor.swift
//  Marley Spoon
//
//  Created by Ahmed Naser on 18/09/2021.
//

import Foundation
class RecipeSceneInteractor: RecipeSceneBusinessLogic {
    private var currentItems = [Recipe]()
    private let limit = 20
    private var couldFetchNewData = true
    var presenter: RecipeScenePresentationLogic
    var worker: RecipeSceneWorkerType

    init(presenter: RecipeScenePresentationLogic, worker: RecipeSceneWorkerType) {
        self.presenter = presenter
        self.worker = worker
    }
    
    
}

extension RecipeSceneInteractor {
    func getRecipes() {
        let skip = currentItems.count > 0 ? limit + currentItems.count: 0
        worker.getRecipes(limit: limit, skip: skip) { [weak self] result in
            guard let self = self else {return}
            switch result{
            case .success(let recipes):
                self.couldFetchNewData = recipes.count > self.limit
                self.currentItems.append(contentsOf: recipes)
                self.presenter.displayRecipes(items: recipes)
            case .failure(let error):
                self.presenter.displayError(error: error)
            }
        }
    }
    
    func getNewRecipes(currentIndex: Int) {
        guard  currentIndex == currentItems.count - 4 && couldFetchNewData else{
            return
        }
        getRecipes()
    }
    
}
