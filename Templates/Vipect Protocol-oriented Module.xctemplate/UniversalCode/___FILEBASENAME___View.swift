//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  ___COPYRIGHT___
//

import UIKit
import Vipect

// MARK: ___VARIABLE_ViperitModuleName___View Class
final class ___VARIABLE_ViperitModuleName___View: UserInterface {
}

// MARK: - ___VARIABLE_ViperitModuleName___View API
extension ___VARIABLE_ViperitModuleName___View: ___VARIABLE_ViperitModuleName___ViewApi {
	var input: ___VARIABLE_ViperitModuleName___ViewInput {
        ___VARIABLE_ViperitModuleName___ViewInput()
    }

    func bindOutput(_ output: ___VARIABLE_ViperitModuleName___ViewOutput) {
        
    }
}

// MARK: - ___VARIABLE_ViperitModuleName___View Viper Components API
private extension ___VARIABLE_ViperitModuleName___View {
	// swiftlint:disable force_cast
    var presenter: ___VARIABLE_ViperitModuleName___PresenterApi {
        _presenter as! ___VARIABLE_ViperitModuleName___PresenterApi
    }
    // swiftlint:enable force_cast
}
