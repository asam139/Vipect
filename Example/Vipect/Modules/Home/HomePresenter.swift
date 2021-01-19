//
//  HomePresenter.swift
//  Vipect_Example
//
//  Created by Saul Moreno Abril on 23/12/20.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import Foundation
import Vipect
import RxSwift
import RxCocoa


final class HomePresenter: Presenter {
    private var disposeBag = DisposeBag()
    private let messageSub = PublishRelay<String>()

    override func viewDidLoad() {
        super.viewDidLoad()
        loadContent()
    }

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

    func reactToSomeInteractorOperation() {
        print("Home Presenter Reacted to Some Interactor Operation")
        showInfo(message: "CONTENT_LOADED")
    }

    func showSecondModule() {
        router.showSecondModule()
    }
}


// MARK: - VIPER COMPONENTS API (Auto-generated code)
private extension HomePresenter {
    var view: HomeViewInterface {
        return _view as! HomeViewInterface
    }
    var interactor: HomeInteractor {
        return _interactor as! HomeInteractor
    }
    var router: HomeRouter {
        return _router as! HomeRouter
    }
}
