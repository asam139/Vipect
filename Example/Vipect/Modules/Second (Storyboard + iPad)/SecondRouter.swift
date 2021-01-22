//
//  SecondRouter.swift
//  Vipect_Example
//
//  Created by Saul Moreno Abril on 23/12/20.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import UIKit
import Vipect

final class SecondRouter: Router {
    func close() {
        dismiss(animated: true, completion: nil)
    }
}

// MARK: - VIPER COMPONENTS API (Auto-generated code)
private extension SecondRouter {
    var presenter: SecondPresenter {
        return _presenter as! SecondPresenter
    }
}
