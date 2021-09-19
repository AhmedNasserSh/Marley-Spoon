//
//  Tag.swift
//  Marley Spoon
//
//  Created by Ahmed Naser on 16/09/2021.
//

import Foundation
import Contentful

class Tag: EntryDecodable, Resource, FieldKeysQueryable {

    static let contentTypeId = "tag"

    let sys: Sys
    let name: String

    required init(from decoder: Decoder) throws {
        sys = try decoder.sys()
        let container = try decoder.contentfulFieldsContainer(keyedBy: FieldKeys.self)
        name = try container.decode(String.self, forKey: .name)
    }

    enum FieldKeys: String, CodingKey {
        case name
    }
}
