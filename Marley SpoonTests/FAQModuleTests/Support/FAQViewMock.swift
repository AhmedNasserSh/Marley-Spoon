//
//  FAQViewMock.swift
//  Marley SpoonTests
//
//  Created by Ahmed Naser on 19/09/2021.
//

import Foundation
@testable import Marley_Spoon

class FAQViewMock: FAQSceneDisplayView {
    var interactor: FAQSceneBusinessLogic?
    var items = [FAQScene.FAQViewSection]()
    var didCallUpdateSection = false
    var didCalldisplayError = false

    func setFAQs(items: [FAQScene.FAQViewSection]) {
        self.items = items
    }
    
    func updateSection(section: Int, items: [FAQScene.FAQViewSectionItem]) {
        didCallUpdateSection = true
    }
    
    func displayError(error: NetworkError) {
        didCalldisplayError = true
    }
    
    
}

