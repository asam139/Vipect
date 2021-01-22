//
//  ThirdInteractor.swift
//  Vipect
//
//  Created by Saúl Moreno Abril on 22/1/21.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import Foundation
import Vipect

// MARK: - ThirdInteractor Class
final class ThirdInteractor: Interactor {
}

// MARK: - ThirdInteractor API
extension ThirdInteractor: ThirdInteractorApi {
}

// MARK: - Interactor Viper Components Api
private extension ThirdInteractor {
	// swiftlint:disable force_cast
    var presenter: ThirdPresenterApi {
        _presenter as! ThirdPresenterApi
    }
    // swiftlint:enable force_cast
}
