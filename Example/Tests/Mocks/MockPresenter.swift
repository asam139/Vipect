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

    override func viewDidLoad() {
        super.viewDidLoad()
        called(method: kViewDidLoaded)
    }
    override func viewWillAppear() {
        super.viewWillAppear()
        called(method: kViewWillAppear)
    }
    override func viewDidAppear() {
        super.viewDidAppear()
        called(method: kViewDidAppear)
    }
    override func viewWillDisappear() {
        super.viewWillDisappear()
        called(method: kViewWillDisappear)
    }
    override func viewDidDisappear() {
        super.viewDidDisappear()
        called(method: kViewDidDisappear)
    }

    override func setUpView() {
        super.setUpView()
        called(method: kSetUpView)
    }

    var deinitCalled: (() -> Void)?
    deinit { deinitCalled?() }
}
