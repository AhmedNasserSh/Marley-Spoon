//
//  RecipeServiceMock.swift
//  Marley SpoonTests
//
//  Created by Ahmed Naser on 19/09/2021.
//

import Foundation
@testable import Marley_Spoon

class RecipeServiceMock: RecipeServiceUseCase {
    func getRecipes(limit: Int, skip: Int, completion: @escaping (Result<[Recipe], NetworkError>) -> Void) {
        let response = ResponseMockHelper<RecipeItems>().getMockResponse(jsonFileName: "RecipesData")
            .map{return Array($0.items[0..<limit])}
        completion(response)
    }
    
    
    
 
}
