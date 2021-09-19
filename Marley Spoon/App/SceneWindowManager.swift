//
//  SceneWindowManager.swift
//  Marley Spoon
//
//  Created by Ahmed Naser on 18/09/2021.
//

import Foundation
import UIKit

enum SceneWindowManager {
    static func setupWindow(window: UIWindow) {
        let controller = UIStoryboard(name: "TabViewController", bundle: nil).instantiateInitialViewController()
        window.rootViewController = controller
        window.makeKeyAndVisible()
        self.window = window
    }
}

private extension SceneWindowManager {
    static var window: UIWindow?
    static var windowFrame: CGRect {
        return UIScreen.main.bounds
    }
}
