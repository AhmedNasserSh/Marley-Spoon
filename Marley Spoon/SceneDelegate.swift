//
//  SceneDelegate.swift
//  Marley Spoon
//
//  Created by Ahmed Naser on 14/09/2021.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
            SceneWindowManager.setupWindow(window: window)
        }
    }
    
}

