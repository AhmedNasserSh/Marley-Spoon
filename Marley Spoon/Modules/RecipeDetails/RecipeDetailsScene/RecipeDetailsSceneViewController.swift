//
//  RecipeDetailsSceneViewController.swift
//  Marley Spoon
//
//  Created by Ahmed Naser on 18/09/2021.
//

import UIKit

class RecipeDetailsSceneViewController: UIViewController {
    @IBOutlet weak var recipeImageView: UIImageView!
    @IBOutlet weak var recipeTitleLabel: UILabel!
    @IBOutlet weak var recipeSubTitleLabel: UILabel!
    @IBOutlet weak var recipeDesciptionLabel: UILabel!
    @IBOutlet weak var recipeChefNameLabel: UILabel!
    @IBOutlet weak var tagsCollectionView: UICollectionView! {
        didSet {
            tagsCollectionView.register(UINib(nibName: RecipeDetailsSceneCollectionViewCell.Identifier, bundle: nil),
                                        forCellWithReuseIdentifier: RecipeDetailsSceneCollectionViewCell.Identifier)
        }
    }

    
    var recipe: RecipeScene.ViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showRecipe()
    }
    
    func showRecipe() {
        recipeImageView.image = recipe?.image
        recipeTitleLabel.text = recipe?.title
        recipeSubTitleLabel.text = recipe?.subTitle
        recipeDesciptionLabel.text = recipe?.description
        formatChefName()
        checkTags()
    }
    
    func formatChefName() {
        guard let chefName =  recipe?.chefName else {
            hideChefName()
            return
        }
        let greentColorAttributes: [NSAttributedString.Key : Any] = [
            NSAttributedString.Key.foregroundColor: UIColor.systemGreen,
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 15, weight: .bold)
        ]
        let blackColorAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
        
        let partOne = NSMutableAttributedString(string: "Shared with you by: " , attributes: blackColorAttributes as [NSAttributedString.Key : Any])
        let partTwo = NSMutableAttributedString(string: chefName, attributes: greentColorAttributes as [NSAttributedString.Key : Any])
        
        let combination = NSMutableAttributedString()
        combination.append(partOne)
        combination.append(partTwo)
        recipeChefNameLabel.attributedText = combination
    }
    
    func hideChefName() {
        recipeChefNameLabel.isHidden = true
    }
    
    func checkTags() {
        tagsCollectionView.isHidden = (recipe?.tags.count == 0)
    }
}
extension RecipeDetailsSceneViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return recipe?.tags.count ?? 0
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RecipeDetailsSceneCollectionViewCell.Identifier,for: indexPath) as! RecipeDetailsSceneCollectionViewCell
        cell.configure(tag: recipe?.tags[indexPath.row].name)
        return cell
    }
    
}
