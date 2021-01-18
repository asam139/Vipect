//
//  XibModulePresenter.swift
//  Vipect_Tests
//
//  Created by Saul Moreno Abril on 23/12/20.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import Foundation
import Vipect

// MARK: - XibModulePresenter Class
final class XibModulePresenter: Presenter {
}

// MARK: - XibModulePresenter API
extension XibModulePresenter: XibModulePresenterApi {
}

// MARK: - XibModule Viper Components
private extension XibModulePresenter {
    var view: XibModuleViewApi {
        return _view as! XibModuleViewApi
    }
    var interactor: XibModuleInteractorApi {
        return _interactor as! XibModuleInteractorApi
    }
    var router: XibModuleRouterApi {
        return _router as! XibModuleRouterApi
    }
}
