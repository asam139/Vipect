//
//  CollectionUserInterfaceTests.swift
//  Vipect_Tests
//
//  Created by Saúl Moreno Abril on 19/1/21.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import Quick
import Nimble
import Vipect
import Swinject

class CollectionUserInterfaceTests: QuickSpec {
    override func spec() {
        describe("CollectionUserInterface") {
            var userInterface: UserInterfaceProtocol!
            var presenter: MockPresenter!

            beforeEach {
                userInterface = CollectionUserInterface(collectionViewLayout: .init())
                presenter = MockPresenter(container: Container())
                userInterface._presenter = presenter
            }

            func expectViewLifecycle(method: String, simulate: ((UIViewController) -> Void)? = nil) {
                presenter.methodExpected = method
                // Simulate view lifecycle
                simulate?(userInterface.viewController)

                expect(presenter.isCalled).toEventually(beTrue())
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
