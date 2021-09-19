//
//  FAQProtocols.swift
//  Marley Spoon
//
//  Created by Ahmed Naser on 19/09/2021.
//

import Foundation
import UIKit

protocol FAQSceneDisplayView: AnyObject {
    var interactor: FAQSceneBusinessLogic? {get}
    
    func setFAQs(items: [FAQScene.FAQViewSection])
    func updateSection(section:Int, items:  [FAQScene.FAQViewSectionItem])
    func displayError(error: NetworkError)
    
}

protocol FAQSceneBusinessLogic: AnyObject {
    var presenter: FAQScenePresentationLogic {get}
    var worker: FAQSceneWorkerType {get}
    
    func getFAQs()
    func setExpanded(section: Int, items: [FAQScene.FAQViewSectionItem], id: String)
}

protocol FAQScenePresentationLogic: AnyObject {
    var view: FAQSceneDisplayView? {get}
    func displayFAQs(items: [FAQSection])
    func setExpanded(section: Int, items: [FAQScene.FAQViewSectionItem], id: String)

    func displayError(error: NetworkError)
}

protocol FAQSceneWorkerType {
    init(service: FAQServiceUseCase)
    func getFAQs(limit: Int, skip: Int, completion: @escaping (Result<[FAQSection], NetworkError>) -> Void)
}
