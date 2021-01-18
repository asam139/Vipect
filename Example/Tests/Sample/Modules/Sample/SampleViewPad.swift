//
//  SampleViewPad.swift
//  Vipect_Tests
//
//  Created by Saul Moreno Abril on 23/12/20.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import UIKit
import Vipect

// MARK: Sample View for Tablet
final class SampleViewPad: UserInterface {
}

// MARK: - Public interface implementation
extension SampleViewPad: SampleViewInterface {
}

// MARK: - VIPER COMPONENTS API (Auto-generated code)
private extension SampleViewPad {
    var presenter: SamplePresenter {
        return _presenter as! SamplePresenter
    }
}
