//
//  HomeRouter.swift
//  Vipect
//
//  Created by Saúl Moreno Abril on 22/1/21.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import Foundation
import Vipect

// MARK: - HomeRouter class
final class HomeRouter: Router {
}

// MARK: - HomeRouter API
extension HomeRouter: HomeRouterApi {
    func showSecondModule() {
        let module = AppModules.second.build()
        module.router.present(from: viewController, embedInNavController: true)
    }
    
    func showThirdModule() {
        let module = AppModules.third.build()
        module.router.show(from: viewController)
    }
}

// MARK: - Home Viper Components
private extension HomeRouter {
	// swiftlint:disable force_cast
    var presenter: HomePresenterApi {
        _presenter as! HomePresenterApi
    }
    // swiftlint:enable force_cast
}
