//
//  CodeModulePresenter.swift
//  Vipect_Tests
//
//  Created by Saul Moreno Abril on 23/12/20.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import Foundation
import Vipect

// MARK: - CodeModulePresenter Class
final class CodeModulePresenter: Presenter {
}

// MARK: - CodeModulePresenter API
extension CodeModulePresenter: CodeModulePresenterApi {
}

// MARK: - CodeModule Viper Components
private extension CodeModulePresenter {
    var view: CodeModuleViewApi {
        return _view as! CodeModuleViewApi
    }
    var interactor: CodeModuleInteractorApi {
        return _interactor as! CodeModuleInteractorApi
    }
    var router: CodeModuleRouterApi {
        return _router as! CodeModuleRouterApi
    }
}
