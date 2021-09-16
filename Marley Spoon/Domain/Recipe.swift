//
//  Recipe.swift
//  Marley Spoon
//
//  Created by Ahmed Naser on 14/09/2021.
//

import Foundation
import Contentful

class Recipe: EntryDecodable, Resource, FieldKeysQueryable {
    static let contentTypeId = "recipe"
    
    var sys: Sys
    
    let title: String
    var imageAsset: Asset?
    let calories: Int
    let description: String
    var chef: Chef?
    var tags: [Tag]?

    required init(from decoder: Decoder) throws {
        sys = try decoder.sys()
        let fields = try decoder.contentfulFieldsContainer(keyedBy: FieldKeys.self)
        title = try fields.decode(String.self, forKey: .title)
        calories = try fields.decode(Int.self, forKey: .calories)
        description = try fields.decode(String.self, forKey: .description)

        try fields.resolveLink(forKey: .imageAsset, decoder: decoder) { [weak self] asset in
            self?.imageAsset = asset as? Asset
        }
        try fields.resolveLink(forKey: .chef, decoder: decoder) { [weak self] asset in
            self?.chef = asset as? Chef
        }
        try fields.resolveLinksArray(forKey: .tags, decoder: decoder) { [weak self] array in
            self?.tags = array as? [Tag]
        }
    }
    
    enum FieldKeys: String, CodingKey {
        case title, calories, description, chef, tags
        case imageAsset = "photo"
    }
}
