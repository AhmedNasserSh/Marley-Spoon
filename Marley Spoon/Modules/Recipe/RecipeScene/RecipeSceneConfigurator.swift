//
//  RecipeSceneConfigurator.swift
//  Marley Spoon
//
//  Created by Ahmed Naser on 18/09/2021.
//

import Foundation
import UIKit

enum RecipeSceneConfigurator {
    static func configure() -> UINavigationController {
        let view = RecipeSceneViewController()
        let presenter = RecipeScenePresenter(view: view)
        let worker = RecipeWorker(service: RecipeService())
        let interactor = RecipeSceneInteractor(presenter: presenter, worker: worker, limit: 20)
        let router = RecipeSceneRouter()
        router.view = view
        
        view.interactor = interactor
        view.router = router
        
        return UINavigationController(rootViewController: view)
    }
}
