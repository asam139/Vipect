//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  ___COPYRIGHT___
//

import Foundation
import Vipect

class ___VARIABLE_ViperitModuleName___Presenter: Presenter {
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
        //input.action...
    }
}


// MARK: - VIPER COMPONENTS API (Auto-generated code)
private extension ___VARIABLE_ViperitModuleName___Presenter {
    var view: ___VARIABLE_ViperitModuleName___ViewInterface {
        return _view as! ___VARIABLE_ViperitModuleName___ViewInterface
    }
    var interactor: ___VARIABLE_ViperitModuleName___Interactor {
        return _interactor as! ___VARIABLE_ViperitModuleName___Interactor
    }
    var router: ___VARIABLE_ViperitModuleName___Router {
        return _router as! ___VARIABLE_ViperitModuleName___Router
    }
}
