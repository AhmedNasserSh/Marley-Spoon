//
//  FAQSectionItem.swift
//  Marley Spoon
//
//  Created by Ahmed Naser on 19/09/2021.
//

import Foundation
import Contentful

class FAQSectionItem: EntryDecodable, Resource, FieldKeysQueryable {

    static let contentTypeId = "faqSectionItem"

    let sys: Sys
    let question: String
    let answer: RichTextDocument

    required init(from decoder: Decoder) throws {
        sys = try decoder.sys()
        let container = try decoder.contentfulFieldsContainer(keyedBy: FieldKeys.self)
        question = try container.decode(String.self, forKey: .question)
        answer = try container.decode(RichTextDocument.self, forKey: .answer)
    }

    enum FieldKeys: String, CodingKey {
        case question, answer
    }
}
