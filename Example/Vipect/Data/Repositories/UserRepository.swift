//
//  UserRepository.swift
//  Vipect_Example
//
//  Created by Saúl Moreno Abril on 22/1/21.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import RxSwift
import Swinject
import Moya
protocol UserRepositoryProtocol {
    func getUser() -> Single<User>
}

class UserRepository: UserRepositoryProtocol {
    private let userService: UserApiServiceProtocol
    
    init(userService: UserApiServiceProtocol) {
        self.userService = userService
    }
    
    func getUser() -> Single<User> {
        userService.getUser().map { $0.toDomain() }
    }
}

