//
//  UserApiService.swift
//  Vipect_Example
//
//  Created by Saúl Moreno Abril on 22/1/21.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import Moya

enum UserApi {
    case getUser
}

// MARK: - TargetType Protocol Implementation
extension UserApi: TargetType {
    var baseURL: URL { return URL(string: "https://api.myservice.com")! }
    var path: String {
        switch self {
        case .getUser:
            return "/users"
        }
    }
    var method: Moya.Method {
        switch self {
        case .getUser:
            return .get
        }
    }
    var task: Task {
        switch self {
        case .getUser:
            return .requestPlain
        }
    }
    var sampleData: Data {
        switch self {
        case .getUser:
            return "{\"name\": \"Harry\", \"email\": \"harry@gmail.com\"}".utf8Encoded
        }
    }
    
    var headers: [String: String]? {
        return ["Content-type": "application/json"]
    }
}
// MARK: - Helpers
private extension String {
    var utf8Encoded: Data {
        return data(using: .utf8)!
    }
}
