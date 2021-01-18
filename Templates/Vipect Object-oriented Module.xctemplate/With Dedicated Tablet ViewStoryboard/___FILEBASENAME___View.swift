//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  ___COPYRIGHT___
//

import UIKit
import MeepVIPER

// MARK: - Public Interface Protocol
protocol ___FILEBASENAMEASIDENTIFIER___ViewInterface {
	var input: ___VARIABLE_ViperitModuleName___ViewInput { get }
	func bindOutput(_ output: ___VARIABLE_ViperitModuleName___ViewOutput)
}

// MARK: ___FILEBASENAMEASIDENTIFIER___ View
final class ___FILEBASENAMEASIDENTIFIER___View: UserInterface {
}

// MARK: - Public interface
extension ___FILEBASENAMEASIDENTIFIER___View: ___FILEBASENAMEASIDENTIFIER___ViewInterface {
}

// MARK: - VIPER COMPONENTS API (Auto-generated code)
private extension ___FILEBASENAMEASIDENTIFIER___View {
    var presenter: ___FILEBASENAMEASIDENTIFIER___Presenter {
        return _presenter as! ___FILEBASENAMEASIDENTIFIER___Presenter
    }
}
