//
//  FAQServiceMock.swift
//  Marley SpoonTests
//
//  Created by Ahmed Naser on 19/09/2021.
//

import Foundation
@testable import Marley_Spoon

class FAQServiceMock: FAQServiceUseCase {
    func getFAQSections(limit: Int, skip: Int, completion: @escaping (Result<[FAQSection], NetworkError>) -> Void) {
        let response = ResponseMockHelper<FAQItems>().getMockResponse(jsonFileName: "FAQData")
            .map{return Array($0.items[0..<limit])}
        completion(response)
    }
}
