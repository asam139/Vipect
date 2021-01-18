//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  ___COPYRIGHT___
//

import MeepVIPER

// MARK: - ___VARIABLE_ViperitModuleName___Router API
protocol ___VARIABLE_ViperitModuleName___RouterApi: RouterProtocol {
}

// MARK: - ___VARIABLE_ViperitModuleName___View API
protocol ___VARIABLE_ViperitModuleName___ViewApi: UserInterfaceProtocol {
	var input: ___VARIABLE_ViperitModuleName___ViewInput { get }
	func bindOutput(_ output: ___VARIABLE_ViperitModuleName___ViewOutput)
}

// MARK: - ___VARIABLE_ViperitModuleName___Presenter API
protocol ___VARIABLE_ViperitModuleName___PresenterApi: PresenterProtocol {
}

// MARK: - ___VARIABLE_ViperitModuleName___Interactor API
protocol ___VARIABLE_ViperitModuleName___InteractorApi: InteractorProtocol {
}
