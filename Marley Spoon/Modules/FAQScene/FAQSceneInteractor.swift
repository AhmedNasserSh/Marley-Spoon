//
//  FAQSceneInteractor.swift
//  Marley Spoon
//
//  Created by Ahmed Naser on 19/09/2021.
//

import Foundation
class FAQSceneInteractor: FAQSceneBusinessLogic {
    var presenter: FAQScenePresentationLogic
    var worker: FAQSceneWorkerType
    
    private var currentItems = [FAQSection]()
    private let limit: Int


    init(presenter: FAQScenePresentationLogic, worker: FAQSceneWorkerType,limit: Int ) {
        self.presenter = presenter
        self.worker = worker
        self.limit = limit
    }
    
    
}

extension FAQSceneInteractor {
    func getFAQs() {
        let skip = currentItems.count > 0 ? limit + currentItems.count: 0
        worker.getFAQs(limit: limit, skip: skip) { [weak self] result in
            guard let self = self else {return}
            switch result{
            case .success(let sections):
                self.currentItems.append(contentsOf: sections)
                self.presenter.displayFAQs(items: sections)
            case .failure(let error):
                self.presenter.displayError(error: error)
            }
        }
    }
    
    func setExpanded(section: Int, items: [FAQScene.FAQViewSectionItem], id: String) {
        self.presenter.setExpanded(section: section, items: items, id: id)
    }
}
