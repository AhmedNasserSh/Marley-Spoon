//
//  NetworkError.swift
//  Marley Spoon
//
//  Created by Ahmed Naser on 18/09/2021.
//

import Foundation
public enum NetworkError: Error {
    case
    server(Error),
    unknown
}
