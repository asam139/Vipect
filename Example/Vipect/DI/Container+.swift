//
//  Container+.swift
//  Vipect_Example
//
//  Created by Saúl Moreno Abril on 22/1/21.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import Swinject
import Moya

extension Container {
    static let shared: Container = {
        let container = Container()
        
        container.register(UserApiServiceProtocol.self) { r in
            UserApiService(stubClosure: MoyaProvider.delayedStub(0.1))
        }
        
        container.register(UserRepositoryProtocol.self) { r in
            let service = container.resolve(UserApiServiceProtocol.self)!
            return UserRepository(userService: service)
        }
        
        container.register(UserUseCaseProtocol.self) { r in
            let repo = container.resolve(UserRepositoryProtocol.self)!
            return UserUseCase(repository: repo)
        }
        
        return container
    }()
}


