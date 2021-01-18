//
//  CodeModuleRouter.swift
//  Vipect_Tests
//
//  Created by Saul Moreno Abril on 23/12/20.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import Foundation
import Vipect

// MARK: - CodeModuleRouter class
final class CodeModuleRouter: Router {
}

// MARK: - CodeModuleRouter API
extension CodeModuleRouter: CodeModuleRouterApi {
}

// MARK: - CodeModule Viper Components
private extension CodeModuleRouter {
    var presenter: CodeModulePresenterApi {
        return _presenter as! CodeModulePresenterApi
    }
}
