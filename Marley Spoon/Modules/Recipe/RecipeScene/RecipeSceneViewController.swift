//
//  RecipeViewController.swift
//  Marley Spoon
//
//  Created by Ahmed Naser on 18/09/2021.
//

import UIKit
import ProgressHUD

class RecipeSceneViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!{
        didSet {
            registerCells()
        }
    }
    var errorView: ErrorView?
    
    var interactor: RecipeSceneBusinessLogic?
    var router: RecipeSceneRoutingLogic?
    private var items = [RecipeScene.ViewModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
    }
    
    func initUI() {
        ProgressHUD.show()
        interactor?.getRecipes()
    }
    
    func registerCells() {
        self.collectionView.register(UINib(nibName: RecipeCollectionViewCell.identifier, bundle: nil),
                                     forCellWithReuseIdentifier: RecipeCollectionViewCell.identifier)
    }
    
    func createErrorView() {
        errorView = ErrorView(frame: CGRect(x: 0, y: self.view.frame.height / 2, width: view.frame.width, height: 150))
        errorView?.setErrorMessage()
        errorView?.retryAction = { [weak self] in
            guard let self = self else{ return}
            self.interactor?.getRecipes()
        }
        
    }
    
}
// MARK: - UICollectionViewDataSource
extension RecipeSceneViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RecipeCollectionViewCell.identifier,
                                                      for: indexPath) as!  RecipeCollectionViewCell
        cell.configure(recipe: items[indexPath.row])
        return cell
    }
}
// MARK: - UICollectionViewDelegate
extension RecipeSceneViewController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        interactor?.getNewRecipes(currentIndex: indexPath.row)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let flowayout = collectionViewLayout as? UICollectionViewFlowLayout
        let space: CGFloat = (flowayout?.minimumInteritemSpacing ?? 0.0) + (flowayout?.sectionInset.left ?? 0.0) + (flowayout?.sectionInset.right ?? 0.0)
        let size:CGFloat = (collectionView.frame.size.width - space) / 2.0
        return CGSize(width: size, height: 270)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.router?.displayRecipeDetails(item: items[indexPath.row])
    }
    
}
extension RecipeSceneViewController: RecipeSceneDisplayView{
    func setRecipes(items: [RecipeScene.ViewModel]) {
        ProgressHUD.dismiss()
        resetCollectionView()
        self.items.append(contentsOf: items)
        self.collectionView.reloadData()
    }
    
    func displayError(error: NetworkError) {
        ProgressHUD.dismiss()
        showErrorView(message: error.localizedDescription)
    }
    
    private func showErrorView(message: String) {
        self.createErrorView()
        collectionView.backgroundView = errorView!
    }
    
    private func resetCollectionView() {
        collectionView.backgroundView = nil
    }
    
}

