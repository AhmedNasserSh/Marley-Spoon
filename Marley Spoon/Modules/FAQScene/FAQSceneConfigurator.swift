//
//  FAQSceneConfigurator.swift
//  Marley Spoon
//
//  Created by Ahmed Naser on 19/09/2021.
//

import Foundation
import UIKit

enum FAQSceneConfigurator {
    static func configure() -> UINavigationController {
        let view = FAQSceneViewController()
        let presenter = FAQScenePresenter(view: view)
        let worker = FAQSceneWorker(service: FAQServiceService())
        let interactor = FAQSceneInteractor(presenter: presenter, worker: worker, limit: 100)
        
        view.interactor = interactor
        
        return UINavigationController(rootViewController: view)
    }
}
