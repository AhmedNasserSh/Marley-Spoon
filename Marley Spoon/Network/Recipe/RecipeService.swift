//
//  RecipeService.swift
//  Marley Spoon
//
//  Created by Ahmed Naser on 18/09/2021.
//

import Foundation
import Contentful

protocol RecipeServiceUseCase {
    func getRecipes(limit: Int, skip: Int, completion: @escaping(Result<[Recipe],NetworkError>) -> Void)
}

class RecipeService: NetworkService, RecipeServiceUseCase {
    
    
    func getRecipes(limit: Int, skip: Int, completion: @escaping (Result<[Recipe], NetworkError>) -> Void) {
        let query = QueryOn<Recipe>().limit(to: UInt(limit)).skip(theFirst: UInt(skip))
        client.fetchArray(of: Recipe.self,matching: query) {[weak self] result in
            DispatchQueue.main.async {
                guard let _ = self else {
                    completion(.failure(.unknown))
                    return
                }
                print(result)
                switch result {
                case .success(let response):
                    completion(.success(response.items))
                case.failure(let error):
                    completion(.failure(.server(error)))
                }
            }
            
        }
    }
}
