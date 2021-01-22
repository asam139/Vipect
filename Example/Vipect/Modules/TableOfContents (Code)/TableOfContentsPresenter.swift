//
//  TableOfContentsPresenter.swift
//  Vipect_Example
//
//  Created by Saul Moreno Abril on 23/12/20.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import Foundation
import Vipect

// MARK: - TableOfContentsPresenter Class
final class TableOfContentsPresenter: Presenter {
}

// MARK: - TableOfContentsPresenter API
extension TableOfContentsPresenter: TableOfContentsPresenterApi {
    func showHome() {
        router.goHome()
    }
    
    func showCool() {
        router.goToCool()
    }
    
    func showSimple() {
        router.goToSimple()
    }
}

// MARK: - TableOfContents Viper Components
private extension TableOfContentsPresenter {
    var view: TableOfContentsViewApi {
        return _view as! TableOfContentsViewApi
    }
    var interactor: TableOfContentsInteractorApi {
        return _interactor as! TableOfContentsInteractorApi
    }
    var router: TableOfContentsRouterApi {
        return _router as! TableOfContentsRouterApi
    }
}
