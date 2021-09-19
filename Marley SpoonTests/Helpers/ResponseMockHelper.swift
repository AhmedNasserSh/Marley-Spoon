//
//  ResponseMockHelper.swift
//  Marley SpoonTests
//
//  Created by Ahmed Naser on 19/09/2021.
//

import Foundation
import Contentful
@testable import Marley_Spoon

class ResponseMockHelper<T:Decodable> {
    //MARK: parse data in json model to T Model
    func getMockResponse(jsonFileName:String) -> Result<T,NetworkError>{
        if let path = Bundle(for: type(of: self)).path(forResource: jsonFileName, ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let decoder = Client(spaceId: "", accessToken: "").jsonDecoder
                let jsonResult =  try decoder.decode(T.self, from: data)
                return .success(jsonResult)
            } catch(let error) {
                print(error)
                return .failure(.unknown)
            }
        }
        return .failure(.unknown)
    }
}
