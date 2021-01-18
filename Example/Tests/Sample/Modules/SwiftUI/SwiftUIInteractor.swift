//
//  SwiftUIInteractor.swift
//  Vipect_Tests
//
//  Created by Saul Moreno Abril on 23/12/20.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import Foundation
import Vipect

// MARK: - SwiftUIInteractor Class
final class SwiftUIInteractor: Interactor {
}

// MARK: - SwiftUIInteractor API
extension SwiftUIInteractor: SwiftUIInteractorApi {
}

// MARK: - Interactor Viper Components Api
private extension SwiftUIInteractor {
    var presenter: SwiftUIPresenterApi {
        return _presenter as! SwiftUIPresenterApi
    }
}
