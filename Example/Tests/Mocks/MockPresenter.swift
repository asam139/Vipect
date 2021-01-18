//
//  MockPresenter.swift
//  Vipect_Tests
//
//  Created by Saul Moreno Abril on 2/1/21.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import Foundation
import Vipect

// MARK: - Timeout
let kTimeout: TimeInterval = 0.5

// MARK: - View Lifecycle
let kViewNotLoaded = "viewNotLoaded"
let kViewDidLoaded = "viewDidLoaded"
let kViewWillAppear = "viewWillAppear"
let kViewDidAppear = "viewDidAppear"
let kViewWillDisappear = "viewWillDisappear"
let kViewDidDisappear = "viewDidDisappear"

// MARK: - Setup methods
let kSetUpView = "setUpView"

// MARK: - Mock Presenter
class MockPresenter: Presenter, SamplePresenterInterface {
    var isCalled: Bool = false
    var methodExpected: String!

    private func called(method: String) {
        if methodExpected == method {
            isCalled = true
        }
    }

    override func bindLyfeCycle() {
        super.bindLyfeCycle()

        _view.lifeCycleObservable.subscribe(onNext: { [weak self] value in
            switch value {
            case .notLoaded:
                self?.called(method: kViewNotLoaded)
            case .viewDidLoad:
                self?.called(method: kViewDidLoaded)
            case .viewWillAppear:
                self?.called(method: kViewWillAppear)
            case .viewDidAppear:
                self?.called(method: kViewDidAppear)
            case .viewWillDisappear:
                self?.called(method: kViewWillDisappear)
            case .viewDidDisappear:
                self?.called(method: kViewDidDisappear)
            }
        }).disposed(by: disposeBag)
    }

    override func setUpView() {
        super.setUpView()
        called(method: kSetUpView)
    }
}
