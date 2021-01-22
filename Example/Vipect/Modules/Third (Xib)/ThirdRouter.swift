//
//  ThirdRouter.swift
//  Vipect
//
//  Created by Saúl Moreno Abril on 22/1/21.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import Foundation
import Vipect

// MARK: - ThirdRouter class
final class ThirdRouter: Router {
}

// MARK: - ThirdRouter API
extension ThirdRouter: ThirdRouterApi {
}

// MARK: - Third Viper Components
private extension ThirdRouter {
	// swiftlint:disable force_cast
    var presenter: ThirdPresenterApi {
        _presenter as! ThirdPresenterApi
    }
    // swiftlint:enable force_cast
}
