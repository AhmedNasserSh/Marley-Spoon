//
//  RecipeViewController.swift
//  Marley Spoon
//
//  Created by Ahmed Naser on 18/09/2021.
//

import UIKit

class RecipeSceneViewController: UIViewController {
    var interactor: RecipeSceneBusinessLogic?
    var router: RecipeSceneRoutingLogic?
    private var items = [RecipeScene.ViewModel]()

    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
    }
    
    func initUI() {
        registerCells()
        interactor?.getRecipes()
    }
    
    func registerCells() {
        self.collectionView.register(UINib(nibName: "RecipeCollectionViewCell", bundle: nil),
                                     forCellWithReuseIdentifier: RecipeCollectionViewCell.identifier)
    }

}

extension RecipeSceneViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        interactor?.getNewRecipes(currentIndex: indexPath.row)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RecipeCollectionViewCell.identifier,
                                                      for: indexPath) as!  RecipeCollectionViewCell
        cell.configure(recipe: items[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            let flowayout = collectionViewLayout as? UICollectionViewFlowLayout
            let space: CGFloat = (flowayout?.minimumInteritemSpacing ?? 0.0) + (flowayout?.sectionInset.left ?? 0.0) + (flowayout?.sectionInset.right ?? 0.0)
            let size:CGFloat = (collectionView.frame.size.width - space) / 2.0
            return CGSize(width: size, height: 270)
        }


}
extension RecipeSceneViewController: RecipeSceneDisplayView{
    func setRecipes(items: [RecipeScene.ViewModel]) {
        self.items.append(contentsOf: items)
        self.collectionView.reloadData()
    }
    
    func displayError(error: NetworkError) {
        
    }
    
}
