//
//  HomeInteractor.swift
//  Vipect
//
//  Created by Saúl Moreno Abril on 22/1/21.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import Foundation
import Vipect

// MARK: - HomeInteractor Class
final class HomeInteractor: Interactor {
}

// MARK: - HomeInteractor API
extension HomeInteractor: HomeInteractorApi {
    func someInteractorOperation() {
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(2)) { [weak self] in
            self?.presenter.reactToSomeInteractorOperation()
        }
    }
}

// MARK: - Interactor Viper Components Api
private extension HomeInteractor {
	// swiftlint:disable force_cast
    var presenter: HomePresenterApi {
        _presenter as! HomePresenterApi
    }
    // swiftlint:enable force_cast
}
