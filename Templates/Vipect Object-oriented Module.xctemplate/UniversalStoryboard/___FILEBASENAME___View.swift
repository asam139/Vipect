//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  ___COPYRIGHT___
//

import UIKit
import Vipect

// MARK: - Public Interface Protocol
protocol ___VARIABLE_ViperitModuleName___ViewInterface {
	var input: ___VARIABLE_ViperitModuleName___ViewInput { get }
	func bindOutput(_ output: ___VARIABLE_ViperitModuleName___ViewOutput)
}

// MARK: ___VARIABLE_ViperitModuleName___View Class
final class ___VARIABLE_ViperitModuleName___View: UserInterface {
}

// MARK: - Public interface
extension ___VARIABLE_ViperitModuleName___View: ___VARIABLE_ViperitModuleName___ViewInterface {
	var input: ___VARIABLE_ViperitModuleName___ViewInput {
        ___VARIABLE_ViperitModuleName___ViewInput()
    }

    func bindOutput(_ output: ___VARIABLE_ViperitModuleName___ViewOutput) {
        
    }
}

// MARK: - VIPER COMPONENTS API (Auto-generated code)
private extension ___VARIABLE_ViperitModuleName___View {
    var presenter: ___VARIABLE_ViperitModuleName___Presenter {
        return _presenter as! ___VARIABLE_ViperitModuleName___Presenter
    }
}
