//
//  PerfectPresenter.swift
//  Vipect_Example
//
//  Created by Saul Moreno Abril on 23/12/20.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import Foundation
import Vipect

// MARK: - PerfectPresenter Class
final class PerfectPresenter: Presenter {
}

// MARK: - PerfectPresenter API
extension PerfectPresenter: PerfectPresenterApi {
}

// MARK: - Perfect Viper Components
private extension PerfectPresenter {
    var interactor: PerfectInteractorApi {
        return _interactor as! PerfectInteractorApi
    }
    var router: PerfectRouterApi {
        return _router as! PerfectRouterApi
    }
}
