//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  ___COPYRIGHT___
//

import Foundation
import RxSwift
import RxCocoa
import MeepVIPER

class ___FILEBASENAMEASIDENTIFIER___Presenter: Presenter {
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
private extension ___FILEBASENAMEASIDENTIFIER___Presenter {
    var view: ___FILEBASENAMEASIDENTIFIER___ViewInterface {
        return _view as! ___FILEBASENAMEASIDENTIFIER___ViewInterface
    }
    var interactor: ___FILEBASENAMEASIDENTIFIER___Interactor {
        return _interactor as! ___FILEBASENAMEASIDENTIFIER___Interactor
    }
    var router: ___FILEBASENAMEASIDENTIFIER___Router {
        return _router as! ___FILEBASENAMEASIDENTIFIER___Router
    }
}
