//
//  FAQSceneWorker.swift
//  Marley Spoon
//
//  Created by Ahmed Naser on 19/09/2021.
//

import Foundation
class FAQSceneWorker: FAQSceneWorkerType {
    private let service: FAQServiceUseCase

    required init(service: FAQServiceUseCase) {
        self.service = service
    }
    
    func getFAQs(limit: Int, skip: Int, completion: @escaping (Result<[FAQSection], NetworkError>) -> Void) {
        service.getFAQSections(limit: limit, skip: skip, completion: completion)
    }
    
}
