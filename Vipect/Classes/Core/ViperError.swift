//
//  ViperError.swift
//  Vipect
//
//  Created by Saul Moreno Abril on 22/12/20.
//

import Foundation

enum ViperError: Error {
    case methodNotImplemented

    var description: String {
        var message = ""
        switch self {
        case .methodNotImplemented: message = "Method not implemented"
        }
        return "[VIPER WARNING]: \(message)"
    }
}
