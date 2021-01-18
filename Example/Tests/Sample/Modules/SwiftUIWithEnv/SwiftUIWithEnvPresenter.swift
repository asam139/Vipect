//
//  SwiftUIWithEnvPresenter.swift
//  Vipect_Tests
//
//  Created by Saul Moreno Abril on 23/12/20.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import Foundation
import Vipect

// MARK: - SwiftUIWithEnvPresenter Class
final class SwiftUIWithEnvPresenter: Presenter {
}

// MARK: - SwiftUIWithEnvPresenter API
extension SwiftUIWithEnvPresenter: SwiftUIWithEnvPresenterApi {
}

// MARK: - SwiftUIWithEnv Viper Components
private extension SwiftUIWithEnvPresenter {
    var interactor: SwiftUIWithEnvInteractorApi {
        return _interactor as! SwiftUIWithEnvInteractorApi
    }
    var router: SwiftUIWithEnvRouterApi {
        return _router as! SwiftUIWithEnvRouterApi
    }
}
