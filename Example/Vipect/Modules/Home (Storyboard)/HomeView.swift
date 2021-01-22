//
//  HomeView.swift
//  Vipect
//
//  Created by Saúl Moreno Abril on 22/1/21.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import UIKit
import Vipect
import RxSwift
import RxCocoa


// MARK: HomeView Class
final class HomeView: UserInterface {
    private var disposeBag = DisposeBag()
    private let actionSubject = PublishRelay<HomeViewAction>()

    @IBOutlet weak var messageLabel: UILabel!

    @IBAction func goToSecondModule() {
        presenter.showSecondModule()
    }
    
    @IBAction func goToThirdModule() {
        presenter.showThirdModule()
    }
}

// MARK: - HomeView API
extension HomeView: HomeViewApi {
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

// MARK: - HomeView Viper Components API
private extension HomeView {
	// swiftlint:disable force_cast
    var presenter: HomePresenterApi {
        _presenter as! HomePresenterApi
    }
    // swiftlint:enable force_cast
}
