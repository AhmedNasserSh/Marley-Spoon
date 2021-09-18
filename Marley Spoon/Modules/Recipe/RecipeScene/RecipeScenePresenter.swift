//
//  RecipeScenePresenter.swift
//  Marley Spoon
//
//  Created by Ahmed Naser on 18/09/2021.
//

import Foundation
import UIKit

class RecipeScenePresenter: RecipeScenePresentationLogic {
    weak var view: RecipeSceneDisplayView?
    
    init(view: RecipeSceneDisplayView) {
        self.view  = view
    }
}

extension RecipeScenePresenter {
    func displayRecipes(items: [Recipe]) {
        let recipeViewModels: [RecipeScene.ViewModel] = items.map { recipe in
            var image = UIImage()
            if let imageURL = recipe.imageAsset?.url,
               let data = try? Data(contentsOf: imageURL),
               let displayImage = UIImage(data: data){
                 image = displayImage
            }
            let (title,subTitle) = computeTitleAndSubTitle(recipeTitle: recipe.title)
  
            return RecipeScene.ViewModel(id: recipe.id,
                                         image: image,
                                         title: title,
                                         subTitle: subTitle)
        }
        
        self.view?.setRecipes(items: recipeViewModels)
    }
    func computeTitleAndSubTitle(recipeTitle: String) -> (String,String) {
        var title = ""
        var subTitle = ""
        let words = recipeTitle.condenseWhitespace().components(separatedBy: "with")
        if words.count == 2 {
            title = words[0]
            subTitle = "with" + words[1]
        }else {
            title = recipeTitle
        }
        
        return (title,subTitle)
    }
    func displayError(error: NetworkError) {
        self.view?.displayError(error: error)
    }
}
