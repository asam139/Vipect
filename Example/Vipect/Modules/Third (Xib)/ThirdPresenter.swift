//
//  ThirdPresenter.swift
//  Vipect
//
//  Created by Saúl Moreno Abril on 22/1/21.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import Foundation
import Vipect

// MARK: - ThirdPresenter Class
final class ThirdPresenter: Presenter {
	override func bindWithView() {
        super.bindWithView()

        let input = view.input
        bindInput(input)

        let output = transporm(input: input)
        view.bindOutput(output)
    }

    func transporm(input: ThirdViewInput) -> ThirdViewOutput {
        ThirdViewOutput()
    }

    func bindInput(_ input: ThirdViewInput) {
        //input.action...
    }
}

// MARK: - ThirdPresenter API
extension ThirdPresenter: ThirdPresenterApi {
}

// MARK: - Third Viper Components
private extension ThirdPresenter {
    // swiftlint:disable force_cast
    var view: ThirdViewApi {
        _view as! ThirdViewApi
    }
    var interactor: ThirdInteractorApi {
        _interactor as! ThirdInteractorApi
    }
    var router: ThirdRouterApi {
        _router as! ThirdRouterApi
    }
    // swiftlint:enable force_cast
}
