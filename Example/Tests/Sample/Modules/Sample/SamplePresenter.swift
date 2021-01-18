//
//  SamplePresenter.swift
//  Vipect_Tests
//
//  Created by Saul Moreno Abril on 23/12/20.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import Foundation
import Vipect

//Public API for Presenter (these methods will be visible from the View)
protocol SamplePresenterInterface {
}

final class SamplePresenter: Presenter {
}

extension SamplePresenter: SamplePresenterInterface {
}


// MARK: - VIPER COMPONENTS API (Auto-generated code)
private extension SamplePresenter {
    var view: SampleViewInterface {
        return _view as! SampleViewInterface
    }
    var interactor: SampleInteractor {
        return _interactor as! SampleInteractor
    }
    var router: SampleRouter {
        return _router as! SampleRouter
    }
}
