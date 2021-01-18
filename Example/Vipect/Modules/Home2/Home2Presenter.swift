//
//  Home2Presenter.swift
//  MeepVIPER
//
//  Created by Saul Moreno Abril on 23/12/20.
//Copyright © 2020 CocoaPods. All rights reserved.
//

import Foundation
import MeepVIPER

// MARK: - Home2Presenter Class
final class Home2Presenter: Presenter {
}

// MARK: - Home2Presenter API
extension Home2Presenter: Home2PresenterApi {
}

// MARK: - Home2 Viper Components
private extension Home2Presenter {
    var view: Home2ViewApi {
        return _view as! Home2ViewApi
    }
    var interactor: Home2InteractorApi {
        return _interactor as! Home2InteractorApi
    }
    var router: Home2RouterApi {
        return _router as! Home2RouterApi
    }
}
