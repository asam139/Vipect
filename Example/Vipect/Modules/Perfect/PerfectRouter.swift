//
//  PerfectRouter.swift
//  Vipect_Example
//
//  Created by Saul Moreno Abril on 23/12/20.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import Foundation
import Vipect

// MARK: - PerfectRouter class
final class PerfectRouter: Router {
}

// MARK: - PerfectRouter API
extension PerfectRouter: PerfectRouterApi {
}

// MARK: - Perfect Viper Components
private extension PerfectRouter {
    var presenter: PerfectPresenterApi {
        return _presenter as! PerfectPresenterApi
    }
}
