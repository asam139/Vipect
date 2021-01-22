//
//  SimplePresenter.swift
//  Vipect_Example
//
//  Created by Saul Moreno Abril on 23/12/20.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import Foundation
import Vipect

// MARK: - SimplePresenter Class
final class SimplePresenter: Presenter {
}

// MARK: - SimplePresenter API
extension SimplePresenter: SimplePresenterApi {
}

// MARK: - Simple Viper Components
private extension SimplePresenter {
    var view: SimpleViewApi {
        return _view as! SimpleViewApi
    }
    var interactor: SimpleInteractorApi {
        return _interactor as! SimpleInteractorApi
    }
    var router: SimpleRouterApi {
        return _router as! SimpleRouterApi
    }
}
