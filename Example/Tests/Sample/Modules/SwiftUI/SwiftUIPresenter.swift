//
//  SwiftUIPresenter.swift
//  Vipect_Tests
//
//  Created by Saul Moreno Abril on 23/12/20.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import Foundation
import Vipect

// MARK: - SwiftUIPresenter Class
final class SwiftUIPresenter: Presenter {
}

// MARK: - SwiftUIPresenter API
extension SwiftUIPresenter: SwiftUIPresenterApi {
}

// MARK: - SwiftUI Viper Components
private extension SwiftUIPresenter {
    var interactor: SwiftUIInteractorApi {
        return _interactor as! SwiftUIInteractorApi
    }
    var router: SwiftUIRouterApi {
        return _router as! SwiftUIRouterApi
    }
}
