//
//  AccessibilityIdsReference.swift
//  Marley SpoonUITests
//
//  Created by Ahmed Naser on 19/09/2021.
//

import Foundation
enum AccessibilityIdsReference {
}

//MARK: Recipe Scene
extension AccessibilityIdsReference {
    enum RecipeSceneIds :String{
        case recipeTitleLabelIdentifier
        case recipeSubTitleLabelIdentifier
        case recipeImageViewIdentifier 
        
    }
}

//MARK: Recipe Details Scene
extension AccessibilityIdsReference {
    enum RecipeSceneSceneIds :String {
        case recipeSceneDetailsImageViewIdentifier
        case recipeSceneDetailsTitleLabelIdentifier
        case recipeSceneDetailsSubTitleLabelIdentifier
    }
}
