//
//  TableOfContentsModuleApi.swift
//  Vipect_Example
//
//  Created by Saul Moreno Abril on 23/12/20.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import Vipect

//MARK: - TableOfContentsRouter API
protocol TableOfContentsRouterApi: RouterProtocol {
    func goHome()
    func goToCool()
    func goToSimple()
}

//MARK: - TableOfContentsView API
protocol TableOfContentsViewApi: UserInterfaceProtocol {
}

//MARK: - TableOfContentsPresenter API
protocol TableOfContentsPresenterApi: PresenterProtocol {
    func showHome()
    func showCool()
    func showSimple()
}

//MARK: - TableOfContentsInteractor API
protocol TableOfContentsInteractorApi: InteractorProtocol {
}
