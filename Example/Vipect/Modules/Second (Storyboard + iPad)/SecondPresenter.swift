//
//  SecondPresenter.swift
//  Vipect_Example
//
//  Created by Saul Moreno Abril on 23/12/20.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import Foundation
import Vipect

final class SecondPresenter: Presenter {
    
    func close() {
        router.close()
    }
}


// MARK: - VIPER COMPONENTS API (Auto-generated code)
private extension SecondPresenter {
    var view: SecondViewInterface {
        return _view as! SecondViewInterface
    }
    var interactor: SecondInteractor {
        return _interactor as! SecondInteractor
    }
    var router: SecondRouter {
        return _router as! SecondRouter
    }
}
