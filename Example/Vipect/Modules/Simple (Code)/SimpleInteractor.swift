//
//  SimpleInteractor.swift
//  Vipect_Example
//
//  Created by Saul Moreno Abril on 23/12/20.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import Foundation
import Vipect

// MARK: - SimpleInteractor Class
final class SimpleInteractor: Interactor {
}

// MARK: - SimpleInteractor API
extension SimpleInteractor: SimpleInteractorApi {
}

// MARK: - Interactor Viper Components Api
private extension SimpleInteractor {
    var presenter: SimplePresenterApi {
        return _presenter as! SimplePresenterApi
    }
}
