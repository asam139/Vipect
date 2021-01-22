//
//  SimpleRouter.swift
//  Vipect_Example
//
//  Created by Saul Moreno Abril on 23/12/20.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import Foundation
import Vipect

// MARK: - SimpleRouter class
final class SimpleRouter: Router {
}

// MARK: - SimpleRouter API
extension SimpleRouter: SimpleRouterApi {
}

// MARK: - Simple Viper Components
private extension SimpleRouter {
    var presenter: SimplePresenterApi {
        return _presenter as! SimplePresenterApi
    }
}
