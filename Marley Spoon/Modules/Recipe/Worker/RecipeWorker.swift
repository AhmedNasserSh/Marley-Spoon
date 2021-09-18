//
//  RecipeWorker.swift
//  Marley Spoon
//
//  Created by Ahmed Naser on 18/09/2021.
//

import Foundation
class RecipeWorker: RecipeSceneWorkerType {
    private let service: RecipeServiceUseCase
    
    required init(service: RecipeServiceUseCase) {
        self.service = service
    }
    
    func getRecipes(limit: Int, skip: Int, completion: @escaping (Result<[Recipe], NetworkError>) -> Void) {
        service.getRecipes(limit: limit, skip: skip, completion: completion)
    }
    
    
}
