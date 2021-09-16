//
//  ContentfulCredentials.swift
//  Marley Spoon
//
//  Created by Ahmed Naser on 16/09/2021.
//

import Foundation
struct ContentfulCredentials: Codable, Equatable {

    let spaceId: String
    let contentAPIAccessToken: String

    static let `default`: ContentfulCredentials = {
        guard let bundleInfo = Bundle.main.infoDictionary else { fatalError() }

        let spaceId = bundleInfo["SPACE_ID"] as! String
        let contentAPIAccessToken = bundleInfo["TOKEN"] as! String

        return ContentfulCredentials(
            spaceId: spaceId,
            contentAPIAccessToken: contentAPIAccessToken
        )
    }()
}
