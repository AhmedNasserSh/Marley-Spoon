//
//  NetworkService.swift
//  Marley Spoon
//
//  Created by Ahmed Naser on 18/09/2021.
//

import Foundation
import Contentful

class NetworkService {
    let client: Client
    
    init() {
        self.client = ContentfulProvider(credentials: ContentfulCredentials.default).client
    }
}
