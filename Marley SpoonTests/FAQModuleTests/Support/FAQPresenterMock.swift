//
//  FAQPresenterMock.swift
//  Marley SpoonTests
//
//  Created by Ahmed Naser on 19/09/2021.
//

import Foundation
@testable import Marley_Spoon

class FAQPresenterMock: FAQScenePresentationLogic {
    var view: FAQSceneDisplayView?
    var items:  [FAQSection] = []
    var didSetExpanded = false
    var didDisplayError = false

    func displayFAQs(items: [FAQSection]) {
        self.items = items
    }
    
    func setExpanded(section: Int, items: [FAQScene.FAQViewSectionItem], id: String) {
        didSetExpanded = true
    }
    
    func displayError(error: NetworkError) {
        didDisplayError = true
    }
    
    
}
