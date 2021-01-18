//
//  XibModuleRouter.swift
//  Vipect_Tests
//
//  Created by Saul Moreno Abril on 23/12/20.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import Foundation
import Vipect

// MARK: - XibModuleRouter class
final class XibModuleRouter: Router {
}

// MARK: - XibModuleRouter API
extension XibModuleRouter: XibModuleRouterApi {
}

// MARK: - XibModule Viper Components
private extension XibModuleRouter {
    var presenter: XibModulePresenterApi {
        return _presenter as! XibModulePresenterApi
    }
}
