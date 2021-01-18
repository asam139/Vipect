//
//  SwiftUIRouter.swift
//  Vipect_Tests
//
//  Created by Saul Moreno Abril on 23/12/20.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import Foundation
import Vipect

// MARK: - SwiftUIRouter class
final class SwiftUIRouter: Router {
}

// MARK: - SwiftUIRouter API
extension SwiftUIRouter: SwiftUIRouterApi {
}

// MARK: - SwiftUI Viper Components
private extension SwiftUIRouter {
    var presenter: SwiftUIPresenterApi {
        return _presenter as! SwiftUIPresenterApi
    }
}
