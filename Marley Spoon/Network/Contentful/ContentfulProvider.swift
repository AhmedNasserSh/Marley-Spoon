//
//  ContentfulProvider.swift
//  Marley Spoon
//
//  Created by Ahmed Naser on 16/09/2021.
//

import Foundation
import Contentful

final class ContentfulProvider {

    let client: Client

    init(credentials: ContentfulCredentials) {
        self.client = Client(
            spaceId: credentials.spaceId,
            accessToken: credentials.contentAPIAccessToken,
            contentTypeClasses: ContentfulProvider.contentTypeClasses
        )

    }

    private static var contentTypeClasses: [EntryDecodable.Type] = [
        Recipe.self,
        Chef.self,
        Tag.self
    ]
}
