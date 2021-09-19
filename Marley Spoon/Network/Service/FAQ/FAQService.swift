//
//  FAQService.swift
//  Marley Spoon
//
//  Created by Ahmed Naser on 19/09/2021.
//

import Foundation
import Contentful

protocol FAQServiceUseCase {
    func getFAQSections(limit: Int, skip: Int, completion: @escaping(Result<[FAQSection],NetworkError>) -> Void)
}

class FAQServiceService: NetworkService, FAQServiceUseCase {
    
    
    func getFAQSections(limit: Int, skip: Int, completion: @escaping(Result<[FAQSection],NetworkError>) -> Void) {
        let query = QueryOn<FAQSection>().limit(to: UInt(limit)).skip(theFirst: UInt(skip))
        client.fetchArray(of: FAQSection.self,matching: query) {[weak self] result in
            DispatchQueue.main.async {
                guard let _ = self else {
                    completion(.failure(.unknown))
                    return
                }
                switch result {
                case .success(let response):
                    completion(.success(response.items))
                case.failure(let error):
                    completion(.failure(.server(error)))
                }
            }
            
        }
        
    }
}
