//
//  RecipeDetailsSceneCollectionViewCell.swift
//  Marley Spoon
//
//  Created by Ahmed Naser on 18/09/2021.
//

import UIKit

class RecipeDetailsSceneCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var tagContainerView: UIView!
    @IBOutlet weak var tagLabel: UILabel!
    
    static let Identifier = "RecipeDetailsSceneCollectionViewCell"

    override func awakeFromNib() {
        tagContainerView.layer.cornerRadius = 5
    }
    
    func configure(tag: String?) {
        self.tagLabel.text = tag
    }
}
