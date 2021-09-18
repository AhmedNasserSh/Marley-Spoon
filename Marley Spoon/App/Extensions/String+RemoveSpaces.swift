//
//  String+RemoveSpaces.swift
//  Marley Spoon
//
//  Created by Ahmed Naser on 18/09/2021.
//

import Foundation
extension String {
    func condenseWhitespace() -> String {
        let components = self.components(separatedBy: .whitespacesAndNewlines)
        return components.filter { !$0.isEmpty }.joined(separator: " ")
    }
}
