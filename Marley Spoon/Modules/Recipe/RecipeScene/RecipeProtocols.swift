//
//  RecipeProtocols.swift
//  Marley Spoon
//
//  Created by Ahmed Naser on 18/09/2021.
//

import Foundation
import UIKit

protocol RecipeSceneDisplayView: AnyObject {
    var interactor: RecipeSceneBusinessLogic? {get}
    var router: RecipeSceneRoutingLogic? {get}

    func setRecipes(items: [RecipeScene.ViewModel])
    func displayError(error: NetworkError)

}

protocol RecipeSceneBusinessLogic: AnyObject {
    var presenter: RecipeScenePresentationLogic {get}
    var worker: RecipeSceneWorkerType {get}
    
    func getRecipes()
    func getNewRecipes(currentIndex: Int)
    
}

protocol RecipeScenePresentationLogic: AnyObject {
    var view: RecipeSceneDisplayView? {get}
    func displayRecipes(items: [Recipe])
    func displayError(error: NetworkError)
}

protocol RecipeSceneWorkerType {
    init(service: RecipeServiceUseCase)
    func getRecipes(limit: Int, skip: Int, completion: @escaping (Result<[Recipe], NetworkError>) -> Void)
}

protocol RecipeSceneRoutingLogic {
    var view: UIViewController? {get}
    func displayRecipeDetails(item: RecipeScene.ViewModel)
}
