//
//  RecipeCollectionViewCell.swift
//  Marley Spoon
//
//  Created by Ahmed Naser on 18/09/2021.
//

import UIKit

class RecipeCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var recipeImageView: UIImageView!
    @IBOutlet weak var recipeTitleLabel: UILabel!
    @IBOutlet weak var recipeSubTitleLabel: UILabel!
    @IBOutlet weak var cellView: UIView!
    static let identifier = "RecipeCollectionViewCell"
    
    override func awakeFromNib() {
        self.cellView.layer.cornerRadius = 5
    }
    
    func configure(recipe: RecipeScene.ViewModel) {
        self.recipeImageView.image = recipe.image
        self.recipeTitleLabel.text = recipe.title
        self.recipeSubTitleLabel.text = recipe.subTitle
        
    }
}
