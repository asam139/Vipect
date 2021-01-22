//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  ___COPYRIGHT___
//

import Foundation
import Vipect

// MARK: - ___VARIABLE_ViperitModuleName___Presenter Class
final class ___VARIABLE_ViperitModuleName___Presenter: Presenter {
	override func bindWithView() {
        super.bindWithView()

        let input = view.input
        bindInput(input)

        let output = transporm(input: input)
        view.bindOutput(output)
    }

    func transporm(input: ___VARIABLE_ViperitModuleName___ViewInput) -> ___VARIABLE_ViperitModuleName___ViewOutput {
        ___VARIABLE_ViperitModuleName___ViewOutput()
    }

    func bindInput(_ input: ___VARIABLE_ViperitModuleName___ViewInput) {
        //input.action...
    }
}

// MARK: - ___VARIABLE_ViperitModuleName___Presenter API
extension ___VARIABLE_ViperitModuleName___Presenter: ___VARIABLE_ViperitModuleName___PresenterApi {
}

// MARK: - ___VARIABLE_ViperitModuleName___ Viper Components
private extension ___VARIABLE_ViperitModuleName___Presenter {
    // swiftlint:disable force_cast
    var view: ___VARIABLE_ViperitModuleName___ViewApi {
        _view as! ___VARIABLE_ViperitModuleName___ViewApi
    }
    var interactor: ___VARIABLE_ViperitModuleName___InteractorApi {
        _interactor as! ___VARIABLE_ViperitModuleName___InteractorApi
    }
    var router: ___VARIABLE_ViperitModuleName___RouterApi {
        _router as! ___VARIABLE_ViperitModuleName___RouterApi
    }
    // swiftlint:enable force_cast
}
