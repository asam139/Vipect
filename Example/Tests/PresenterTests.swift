//
//  PresenterTests.swift
//  Vipect_Tests
//
//  Created by Saul Moreno Abril on 23/12/20.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import Quick
import Nimble
import Vipect

class PresenterTests: QuickSpec {
    override func spec() {
        describe("Presenter") {
            func expectViewLifecycle(method: String, simulate: ((UIViewController) -> Void)? = nil) {
                let module = createTestModuleWithMockPresenter(methodToTest: method)
                let presenter = module.presenter as! MockPresenter

                // Simulate view lifecycle
                simulate?(module.view.viewController)

                expect(presenter.isCalled).toEventually(equal(true))
            }

            it("observes view not loaded") {
                expectViewLifecycle(method: kViewNotLoaded)
            }

            it("observes view did loaded") {
                expectViewLifecycle(method: kViewDidLoaded) {
                    $0.viewDidLoad()
                }
            }

            it("observes view will appear") {
                expectViewLifecycle(method: kViewWillAppear) {
                    $0.viewWillAppear(true)
                }
            }

            it("observes view did appear") {
                expectViewLifecycle(method: kViewDidAppear) {
                    $0.viewDidAppear(true)
                }
            }

            it("observes view will disappear") {
                expectViewLifecycle(method: kViewWillDisappear) {
                    $0.viewWillDisappear(true)
                }
            }

            it("observes view did disappear") {
                expectViewLifecycle(method: kViewDidDisappear) {
                    $0.viewDidDisappear(true)
                }
            }

            it("can setup view") {
                expectViewLifecycle(method: kSetUpView) {
                    $0.viewDidLoad()
                }
            }
        }
    }
}
