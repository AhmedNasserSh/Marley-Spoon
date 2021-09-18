//
//  RecipeSceneRouter.swift
//  Marley Spoon
//
//  Created by Ahmed Naser on 18/09/2021.
//

import Foundation
import UIKit

class RecipeSceneRouter: RecipeSceneRoutingLogic {
    weak var view: UIViewController?
    
    func displayRecipeDetails(item: RecipeScene.ViewModel) {
        let detailsView = RecipeDetailsSceneViewController()
        detailsView.recipe = item
        view?.navigationController?.pushViewController(detailsView, animated: true)
    }
    
    
}
