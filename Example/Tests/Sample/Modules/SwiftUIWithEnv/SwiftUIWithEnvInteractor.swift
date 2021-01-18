//
//  SwiftUIWithEnvInteractor.swift
//  Vipect_Tests
//
//  Created by Saul Moreno Abril on 23/12/20.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import Foundation
import Vipect

// MARK: - SwiftUIWithEnvInteractor Class
final class SwiftUIWithEnvInteractor: Interactor {
}

// MARK: - SwiftUIWithEnvInteractor API
extension SwiftUIWithEnvInteractor: SwiftUIWithEnvInteractorApi {
}

// MARK: - Interactor Viper Components Api
private extension SwiftUIWithEnvInteractor {
    var presenter: SwiftUIWithEnvPresenterApi {
        return _presenter as! SwiftUIWithEnvPresenterApi
    }
}
