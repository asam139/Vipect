//
//  CoolInteractor.swift
//  Vipect_Example
//
//  Created by Saul Moreno Abril on 23/12/20.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import Foundation
import Vipect

// MARK: - CoolInteractor Class
final class CoolInteractor: Interactor {
}

// MARK: - CoolInteractor API
extension CoolInteractor: CoolInteractorApi {
}

// MARK: - Interactor Viper Components Api
private extension CoolInteractor {
    var presenter: CoolPresenterApi {
        return _presenter as! CoolPresenterApi
    }
}
