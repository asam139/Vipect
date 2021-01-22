//
//  CoolModuleApi.swift
//  Vipect_Example
//
//  Created by Saul Moreno Abril on 23/12/20.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import Vipect

//MARK: - CoolRouter API
protocol CoolRouterApi: RouterProtocol {
    func goToSecond()
}

//MARK: - CoolPresenter API
protocol CoolPresenterApi: PresenterProtocol {
    func settings() -> UserSettings
    func changeScore()
    func changeRandomName()
    func showAnotherModule()
}

//MARK: - CoolInteractor API
protocol CoolInteractorApi: InteractorProtocol {
}
