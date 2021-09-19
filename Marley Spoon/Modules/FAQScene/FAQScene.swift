//
//  FAQScene.swift
//  Marley Spoon
//
//  Created by Ahmed Naser on 19/09/2021.
//

import Foundation
import UIKit

class FAQScene {
    struct FAQViewSection {
        let title: String
        var items: [FAQViewSectionItem]
        mutating func updateItems(items: [FAQViewSectionItem]) {
            self.items = items
        }
    }
    struct FAQViewSectionItem {
        let id: String
        let question: String
        let answer: String
        var isExpanded: Bool
    }
}
