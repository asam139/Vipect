//
//  HomeRouter.swift
//  Vipect_Example
//
//  Created by Saul Moreno Abril on 23/12/20.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import UIKit
import Vipect

final class HomeRouter: Router {
    func showSecondModule() {
        //let module = AppModules.second.build()
        //module.router.present(from: viewController, embedInNavController: true)
    }
}

// MARK: - VIPER COMPONENTS API (Auto-generated code)
private extension HomeRouter {
    var presenter: HomePresenter {
        return _presenter as! HomePresenter
    }
}
