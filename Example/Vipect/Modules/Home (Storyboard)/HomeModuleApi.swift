//
//  HomeModuleApi.swift
//  Vipect
//
//  Created by Saúl Moreno Abril on 22/1/21.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import Vipect

// MARK: - HomeRouter API
protocol HomeRouterApi: RouterProtocol {
    func showSecondModule()
    func showThirdModule()
}

// MARK: - HomeView API
protocol HomeViewApi: UserInterfaceProtocol {
	var input: HomeViewInput { get }
	func bindOutput(_ output: HomeViewOutput)
}

// MARK: - HomePresenter API
protocol HomePresenterApi: PresenterProtocol {
    func showSecondModule()
    func showThirdModule()
    
    func reactToSomeInteractorOperation()
}

// MARK: - HomeInteractor API
protocol HomeInteractorApi: InteractorProtocol {
    func someInteractorOperation()
}
