//
//  UserUseCase.swift
//  Vipect_Example
//
//  Created by Saúl Moreno Abril on 22/1/21.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import RxSwift

protocol UserUseCaseProtocol {
    func getUser() -> Single<User>
}

class UserUseCase: UserUseCaseProtocol {
    let repository: UserRepositoryProtocol
    
    init(repository: UserRepositoryProtocol) {
        self.repository = repository
    }
    
    func getUser() -> Single<User> {
        repository.getUser()
    }
}
