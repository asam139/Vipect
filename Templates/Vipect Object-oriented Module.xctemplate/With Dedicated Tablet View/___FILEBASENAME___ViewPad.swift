//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  ___COPYRIGHT___
//

import UIKit
import MeepVIPER

// MARK: ___VARIABLE_ViperitModuleName___ViewPad for Tablet
final class ___VARIABLE_ViperitModuleName___ViewPad: UserInterface {
	var input: ___VARIABLE_ViperitModuleName___ViewInput { get }
	func bindOutput(_ output: ___VARIABLE_ViperitModuleName___ViewOutput)
}

// MARK: - Public interface implementation
extension ___VARIABLE_ViperitModuleName___ViewPad: ___VARIABLE_ViperitModuleName___ViewInterface {
}

// MARK: - VIPER COMPONENTS API (Auto-generated code)
private extension ___VARIABLE_ViperitModuleName___ViewPad {
    var presenter: ___VARIABLE_ViperitModuleName___Presenter {
        return _presenter as! ___VARIABLE_ViperitModuleName___Presenter
    }
}
