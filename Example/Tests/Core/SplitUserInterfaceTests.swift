//
//  SplitUserInterfaceTests.swift
//  Vipect_Tests
//
//  Created by Saúl Moreno Abril on 19/1/21.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import Quick
import Nimble
import Vipect

class SplitUserInterfaceTests: QuickSpec {
    override func spec() {
        describe("SplitUserInterface") {
            var userInterface: UserInterfaceProtocol!
            var presenter: MockPresenter!

            beforeEach {
                userInterface = SplitUserInterface()
                presenter = MockPresenter()
                userInterface._presenter = presenter
            }

            func expectViewLifecycle(method: String, simulate: ((UIViewController) -> Void)? = nil) {
                presenter.methodExpected = method
                // Simulate view lifecycle
                simulate?(userInterface.viewController)

                expect(presenter.isCalled).toEventually(equal(true))
            }

            it("calls viewDidLoaded in presenter") {
                expectViewLifecycle(method: kViewDidLoaded) {
                    let window = UIWindow()
                    window.rootViewController = $0
                    window.makeKeyAndVisible()
                }
            }

            it("calls viewWillAppear in presenter") {
                expectViewLifecycle(method: kViewWillAppear) {
                    let window = UIWindow()
                    window.rootViewController = $0
                    window.makeKeyAndVisible()
                }
            }

            it("calls viewDidAppear in presenter") {
                expectViewLifecycle(method: kViewDidAppear) {
                    let window = UIWindow()
                    window.rootViewController = $0
                    window.makeKeyAndVisible()
                }
            }

            it("calls viewWillDisappear inn presenter") {
                expectViewLifecycle(method: kViewWillDisappear) {
                    let window = UIWindow()
                    window.rootViewController = $0
                    window.makeKeyAndVisible()

                    window.rootViewController = UIViewController()
                }
            }

            it("calls viewDidDisappear in presenter") {
                expectViewLifecycle(method: kViewDidDisappear) {
                    let window = UIWindow()
                    window.rootViewController = $0
                    window.makeKeyAndVisible()

                    window.rootViewController = UIViewController()
                }
            }

            it("calls setUpView in presenter") {
                expectViewLifecycle(method: kSetUpView) {
                    let window = UIWindow()
                    window.rootViewController = $0
                    window.makeKeyAndVisible()
                }
            }
        }
    }
}
