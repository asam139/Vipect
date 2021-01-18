//
//  XibModuleInteractor.swift
//  Vipect_Tests
//
//  Created by Saul Moreno Abril on 23/12/20.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import Foundation
import Vipect

// MARK: - XibModuleInteractor Class
final class XibModuleInteractor: Interactor {
}

// MARK: - XibModuleInteractor API
extension XibModuleInteractor: XibModuleInteractorApi {
}

// MARK: - Interactor Viper Components Api
private extension XibModuleInteractor {
    var presenter: XibModulePresenterApi {
        return _presenter as! XibModulePresenterApi
    }
}
