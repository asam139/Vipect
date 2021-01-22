//
//  ThirdView.swift
//  Vipect
//
//  Created by Saúl Moreno Abril on 22/1/21.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import UIKit
import Vipect

// MARK: ThirdView Class
final class ThirdView: UserInterface {
}

// MARK: - ThirdView API
extension ThirdView: ThirdViewApi {
	var input: ThirdViewInput {
        ThirdViewInput()
    }

    func bindOutput(_ output: ThirdViewOutput) {
        
    }
}

// MARK: - ThirdView Viper Components API
private extension ThirdView {
	// swiftlint:disable force_cast
    var presenter: ThirdPresenterApi {
        _presenter as! ThirdPresenterApi
    }
    // swiftlint:enable force_cast
}
