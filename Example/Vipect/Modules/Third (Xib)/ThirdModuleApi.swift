//
//  ThirdModuleApi.swift
//  Vipect
//
//  Created by Saúl Moreno Abril on 22/1/21.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import Vipect

// MARK: - ThirdRouter API
protocol ThirdRouterApi: RouterProtocol {
}

// MARK: - ThirdView API
protocol ThirdViewApi: UserInterfaceProtocol {
	var input: ThirdViewInput { get }
	func bindOutput(_ output: ThirdViewOutput)
}

// MARK: - ThirdPresenter API
protocol ThirdPresenterApi: PresenterProtocol {
}

// MARK: - ThirdInteractor API
protocol ThirdInteractorApi: InteractorProtocol {
}
