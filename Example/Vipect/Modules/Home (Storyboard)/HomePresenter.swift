//
//  HomePresenter.swift
//  Vipect
//
//  Created by Saúl Moreno Abril on 22/1/21.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import Foundation
import Vipect
import RxSwift
import RxCocoa

// MARK: - HomePresenter Class
final class HomePresenter: Presenter {
    private var disposeBag = DisposeBag()
    private let messageSub = PublishRelay<String>()
    
	override func bindWithView() {
        super.bindWithView()

        let input = view.input
        bindInput(input)

        let output = transporm(input: input)
        view.bindOutput(output)
    }

    func transporm(input: HomeViewInput) -> HomeViewOutput {
        HomeViewOutput(text: messageSub.asDriver(onErrorDriveWith: Driver.empty()))
    }

    func bindInput(_ input: HomeViewInput) {
        input.action.drive { [weak self] in
            switch $0 {
            case .showSecondModule:
                self?.showSecondModule()
            }
        }.disposed(by: disposeBag)
    }
}

extension HomePresenter {
    func loadContent() {
        showLoading()
        interactor.someInteractorOperation()
    }

    func showLoading() {
        messageSub.accept("Loading...")
    }

    func showInfo(message: String) {
        messageSub.accept(message)
    }


}

// MARK: - HomePresenter API
extension HomePresenter: HomePresenterApi {
    func showSecondModule() {
        router.showSecondModule()
    }
    
    func showThirdModule() {
        router.showThirdModule()
    }
    
    func reactToSomeInteractorOperation() {
        print("Home Presenter Reacted to Some Interactor Operation")
        showInfo(message: "CONTENT_LOADED")
    }
}

// MARK: - Home Viper Components
private extension HomePresenter {
    // swiftlint:disable force_cast
    var view: HomeViewApi {
        _view as! HomeViewApi
    }
    var interactor: HomeInteractorApi {
        _interactor as! HomeInteractorApi
    }
    var router: HomeRouterApi {
        _router as! HomeRouterApi
    }
    // swiftlint:enable force_cast
}
