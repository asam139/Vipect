//
//  SwiftUIWithEnvRouter.swift
//  Vipect_Tests
//
//  Created by Saul Moreno Abril on 23/12/20.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import Foundation
import Vipect

// MARK: - SwiftUIWithEnvRouter class
final class SwiftUIWithEnvRouter: Router {
}

// MARK: - SwiftUIWithEnvRouter API
extension SwiftUIWithEnvRouter: SwiftUIWithEnvRouterApi {
}

// MARK: - SwiftUIWithEnv Viper Components
private extension SwiftUIWithEnvRouter {
    var presenter: SwiftUIWithEnvPresenterApi {
        return _presenter as! SwiftUIWithEnvPresenterApi
    }
}
