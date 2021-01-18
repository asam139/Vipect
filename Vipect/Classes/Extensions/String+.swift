//
//  String+.swift
//  Vipect
//
//  Created by Saul Moreno Abril on 22/12/20.
//

import Foundation

extension String {
    var first: String {
        return String(prefix(1))
    }
    var uppercasedFirst: String {
        return first.uppercased() + String(dropFirst())
    }
}

extension Optional where Wrapped == String {
    var safeString: String {
        guard let text = self else { return "" }
        return String(describing: text)
    }
}
