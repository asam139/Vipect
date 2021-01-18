//
//  HomeInteractor.swift
//  Vipect_Example
//
//  Created by Saul Moreno Abril on 23/12/20.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import Foundation
import Vipect

final class HomeInteractor: Interactor {
    func someInteractorOperation() {
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(2)) { [weak self] in
            self?.presenter.reactToSomeInteractorOperation()
        }
    }
}

// MARK: - VIPER COMPONENTS API (Auto-generated code)
private extension HomeInteractor {
    var presenter: HomePresenter {
        return _presenter as! HomePresenter
    }
}
