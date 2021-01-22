//
//  UserApiService2.swift
//  Vipect_Example
//
//  Created by Saúl Moreno Abril on 22/1/21.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import RxSwift
import Moya

protocol UserApiServiceProtocol {
    func getUser() -> Single<UserDTO>
}

class UserApiService: MoyaProvider<UserApi>, UserApiServiceProtocol {
    func getUser() -> Single<UserDTO> {
        rx.request(.getUser).map(UserDTO.self)
    }
}
