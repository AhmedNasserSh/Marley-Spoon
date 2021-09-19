//
//  FAQInteractorMock.swift
//  Marley SpoonTests
//
//  Created by Ahmed Naser on 19/09/2021.
//

import Foundation
@testable import Marley_Spoon

class FAQInteractorMock: FAQSceneBusinessLogic {
    var presenter: FAQScenePresentationLogic
    var worker: FAQSceneWorkerType
    var didCallFetchFAQ = false
    var didCallExpand = false

    init() {
        self.presenter = FAQPresenterMock()
        self.worker = FAQSceneWorker(service: FAQServiceMock())
    }
    
    func getFAQs() {
        didCallFetchFAQ = true
    }
    
    func setExpanded(section: Int, items: [FAQScene.FAQViewSectionItem], id: String) {
        didCallExpand = true
    }
    
    
}
