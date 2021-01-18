//
//  Home2Router.swift
//  MeepVIPER
//
//  Created by Saul Moreno Abril on 23/12/20.
//Copyright © 2020 CocoaPods. All rights reserved.
//

import Foundation
import MeepVIPER

// MARK: - Home2Router class
final class Home2Router: Router {
}

// MARK: - Home2Router API
extension Home2Router: Home2RouterApi {
}

// MARK: - Home2 Viper Components
private extension Home2Router {
    var presenter: Home2PresenterApi {
        return _presenter as! Home2PresenterApi
    }
}
