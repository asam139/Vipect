//
//  SecondViewPad.swift
//  Vipect_Example
//
//  Created by Saul Moreno Abril on 23/12/20.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import UIKit
import Vipect

//MARK: Second View for Tablet
final class SecondViewPad: UserInterface {
}

//MARK: - Public interface implementation
extension SecondViewPad: SecondViewInterface {
    @IBAction func close() {
        presenter.close()
    }
}

// MARK: - VIPER COMPONENTS API (Auto-generated code)
private extension SecondViewPad {
    var presenter: SecondPresenter {
        return _presenter as! SecondPresenter
    }
}
