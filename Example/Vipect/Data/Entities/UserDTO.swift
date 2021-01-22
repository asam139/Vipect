//
//  UserDTO.swift
//  Vipect_Example
//
//  Created by Saúl Moreno Abril on 22/1/21.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import Foundation

struct UserDTO: Decodable {
  let name: String?
  let email: String?
}

extension UserDTO {
    func toDomain() -> User {
        User(name: name ?? "Unknown", email: email ?? "")
    }
}
