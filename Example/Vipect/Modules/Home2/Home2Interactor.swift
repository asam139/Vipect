//
//  Home2Interactor.swift
//  MeepVIPER
//
//  Created by Saul Moreno Abril on 23/12/20.
//Copyright © 2020 CocoaPods. All rights reserved.
//

import Foundation
import MeepVIPER

// MARK: - Home2Interactor Class
final class Home2Interactor: Interactor {
}

// MARK: - Home2Interactor API
extension Home2Interactor: Home2InteractorApi {
}

// MARK: - Interactor Viper Components Api
private extension Home2Interactor {
    var presenter: Home2PresenterApi {
        return _presenter as! Home2PresenterApi
    }
}
