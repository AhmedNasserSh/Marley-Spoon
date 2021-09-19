//
//  TabBarViewController.swift
//  Marley Spoon
//
//  Created by Ahmed Naser on 19/09/2021.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setItems()
    }
    
    func setItems() {
        let recipes = RecipeSceneConfigurator.configure()
        recipes.title = "Recipes"
        recipes.tabBarItem.image = UIImage(named: "fork")
        
        let faq = FAQSceneConfigurator.configure()
        faq.title = "FAQ"
        faq.tabBarItem.image = UIImage(named: "information")
        
        self.viewControllers = [recipes,
                                faq]
    }

    
}
