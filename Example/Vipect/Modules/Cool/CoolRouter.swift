//
//  CoolRouter.swift
//  Vipect_Example
//
//  Created by Saul Moreno Abril on 23/12/20.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import Foundation
import Vipect

// MARK: - CoolRouter class
final class CoolRouter: Router {
}

// MARK: - CoolRouter API
extension CoolRouter: CoolRouterApi {
    func goToPerfect() {
        let module = AppModules.perfect.build { _ in
            PerfectView()
        }
        
        let router = module.router as! PerfectRouter
        router.show(from: viewController)
    }
}

// MARK: - Cool Viper Components
private extension CoolRouter {
    var presenter: CoolPresenterApi {
        return _presenter as! CoolPresenterApi
    }
}
