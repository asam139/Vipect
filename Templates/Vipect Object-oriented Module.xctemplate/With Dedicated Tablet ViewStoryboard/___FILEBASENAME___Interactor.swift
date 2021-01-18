//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  ___COPYRIGHT___
//

import Foundation
import MeepVIPER

class ___FILEBASENAMEASIDENTIFIER___Interactor: Interactor {
	override func bindWithView() {
        super.bindWithView()

        let input = view.input
        bindInput(input)

        let output = transporm(input: input)
        view.bindOutput(output)
    }

    func transporm(input: ___VARIABLE_ViperitModuleName___ViewInput) -> ___VARIABLE_ViperitModuleName___ViewOutput {
       
    }

    func bindInput(_ input: ___VARIABLE_ViperitModuleName___ViewInput) {
        input.action.drive { _ in }.disposed(by: disposeBag)
    }
}

// MARK: - VIPER COMPONENTS API (Auto-generated code)
private extension ___FILEBASENAMEASIDENTIFIER___Interactor {
    var presenter: ___FILEBASENAMEASIDENTIFIER___Presenter {
        return _presenter as! ___FILEBASENAMEASIDENTIFIER___Presenter
    }
}
