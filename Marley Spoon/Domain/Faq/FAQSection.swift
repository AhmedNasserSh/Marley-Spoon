//
//  FAQSection.swift
//  Marley Spoon
//
//  Created by Ahmed Naser on 19/09/2021.
//

import Foundation
import Contentful

class FAQSection: EntryDecodable, Resource, FieldKeysQueryable {

    static let contentTypeId = "faqSection"

    let sys: Sys
    let title: String
    var items: [FAQSectionItem]?

    required init(from decoder: Decoder) throws {
        sys = try decoder.sys()
        let fields = try decoder.contentfulFieldsContainer(keyedBy: FieldKeys.self)
        title = try fields.decode(String.self, forKey: .title)
        
        try fields.resolveLinksArray(forKey: .items, decoder: decoder) { [weak self] array in
            self?.items = array as? [FAQSectionItem]
        }
        
    }

    enum FieldKeys: String, CodingKey {
        case title, items
    }
}
