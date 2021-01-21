//
//  HomeView.swift
//  Vipect_Example
//
//  Created by Saul Moreno Abril on 23/12/20.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import UIKit
import Vipect
import RxSwift
import RxCocoa


// MARK: - Public Interface Protocol
protocol HomeViewInterface {
    var input: HomeViewInput { get }
    func bindOutput(_ output: HomeViewOutput)
}

// MARK: Home View
final class HomeView: UserInterface {
    private var disposeBag = DisposeBag()
    private let actionSubject = PublishRelay<HomeViewAction>()
    
    @IBOutlet weak var messageLabel: UILabel!

    @IBAction func goToSecondModuleButtonPressed() {
        presenter.showSecondModule()
    }
}

// MARK: - Public interface
extension HomeView: HomeViewInterface {
    var input: HomeViewInput {
        HomeViewInput(action: actionSubject.asDriver(onErrorDriveWith: Driver.empty()))
    }

    func bindOutput(_ output: HomeViewOutput) {
        output.text
            .asObservable()
            .bind(to: messageLabel.rx.text)
            .disposed(by: disposeBag)
    }
}

// MARK: - VIPER COMPONENTS API (Auto-generated code)
private extension HomeView {
    var presenter: HomePresenter { return _presenter as! HomePresenter }
}


