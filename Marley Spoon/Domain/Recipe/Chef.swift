//
//  Chef.swift
//  Marley Spoon
//
//  Created by Ahmed Naser on 16/09/2021.
//

import Foundation
import Contentful

class Chef: EntryDecodable, Resource, FieldKeysQueryable {

    static let contentTypeId = "chef"

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
