//
//  FAQScenePresenter.swift
//  Marley Spoon
//
//  Created by Ahmed Naser on 19/09/2021.
//

import Foundation
import Contentful

class FAQScenePresenter: FAQScenePresentationLogic {
    weak var view: FAQSceneDisplayView?
    
    init(view: FAQSceneDisplayView) {
        self.view = view
    }
    
}

extension FAQScenePresenter {
    func displayFAQs(items: [FAQSection]) {
        let viewModels: [FAQScene.FAQViewSection] = items.map { section  -> FAQScene.FAQViewSection  in
            let items: [FAQScene.FAQViewSectionItem]? = section.items?.map({ sectionItem in
                var answer = ""
                if sectionItem.answer.content.count > 0 ,
                   let pragraph = sectionItem.answer.content[0] as? Paragraph,
                   pragraph.content.count > 0,let text = pragraph.content[0] as? Text {
                    answer = text.value
                }                
                return FAQScene.FAQViewSectionItem(id: sectionItem.id,
                                                   question: sectionItem.question,
                                                   answer: answer,
                                                   isExpanded: false)
            })
            return FAQScene.FAQViewSection(title: section.title, items: items ?? [])
        }
        
        self.view?.setFAQs(items: viewModels)
    }
    
    
    func setExpanded(section: Int, items: [FAQScene.FAQViewSectionItem], id: String) {
        let mappedItems: [FAQScene.FAQViewSectionItem] = items.map { item in
            if item.id == id {
                var mutableItem = item
                mutableItem.isExpanded = !item.isExpanded
                return mutableItem
            }
            return item
        }
        self.view?.updateSection(section: section, items: mappedItems)
    }
    
    
    func displayError(error: NetworkError) {
        
    }
    
}
