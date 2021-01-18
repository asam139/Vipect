//
//  PerfectInteractor.swift
//  Vipect_Example
//
//  Created by Saul Moreno Abril on 23/12/20.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import Foundation
import Vipect

// MARK: - PerfectInteractor Class
final class PerfectInteractor: Interactor {
}

// MARK: - PerfectInteractor API
extension PerfectInteractor: PerfectInteractorApi {
}

// MARK: - Interactor Viper Components Api
private extension PerfectInteractor {
    var presenter: PerfectPresenterApi {
        return _presenter as! PerfectPresenterApi
    }
}
