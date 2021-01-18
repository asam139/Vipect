//
//  SampleView.swift
//  Vipect_Tests
//
//  Created by Saul Moreno Abril on 23/12/20.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import UIKit
import Vipect

// MARK: - Public Interface Protocol
protocol SampleViewInterface {
}

// MARK: Sample View
final class SampleView: UserInterface {
}

// MARK: - Public interface
extension SampleView: SampleViewInterface {
}

// MARK: - VIPER COMPONENTS API (Auto-generated code)
private extension SampleView {
    var presenter: SamplePresenterInterface {
        return _presenter as! SamplePresenterInterface
    }
}
