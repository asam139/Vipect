//
//  ModuleTests.swift
//  Vipect_Tests
//
//  Created by Saul Moreno Abril on 23/12/20.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import XCTest
import Quick
import Nimble
@testable import Vipect
import Swinject

class ModuleTests: QuickSpec {
    override func spec() {
        describe("Module") {
            it("builds components correctly") {
                let module = createTestModule()

                expect(module.view is SampleView) == true
                expect(module.interactor is SampleInteractor) == true
                expect(module.presenter is SamplePresenter) == true
                expect(module.router is SampleRouter) == true
            }

            it("builds for tablet components") {
                let module = createTestModule(forTablet: true)

                expect(module.view is SampleViewPad) == true
                expect(module.interactor is SampleInteractor) == true
                expect(module.presenter is SamplePresenter) == true
                expect(module.router is SampleRouter) == true
            }

            it("builds components correctly for SwiftUI") {
                let module = createSwiftUIModule()

                expect(module.view is HostingUserInterface<SwiftUIView>) == true
                expect(module.interactor is SwiftUIInteractor) == true
                expect(module.presenter is SwiftUIPresenter) == true
                expect(module.router is SwiftUIRouter) == true
            }

            it("builds components correctly for SwiftUI with environment object") {
                let module = createSwiftUIModuleWithEnvironmentObject()

                expect(module.interactor is SwiftUIWithEnvInteractor) == true
                expect(module.presenter is SwiftUIWithEnvPresenter) == true
                expect(module.router is SwiftUIWithEnvRouter) == true
            }

            it("has the all depencies") {
                let module = createTestModule()

                // Assert view dependencies
                let v = module.view
                let i = module.interactor
                let p = module.presenter
                let r = module.router

                expect(v._presenter is SamplePresenter) == true
                expect(i._presenter is SamplePresenter) == true
                expect(p._view is SampleView) == true
                expect(p._router is SampleRouter) == true
                expect(r._presenter is SamplePresenter) == true
                expect(r._view is SampleView) == true
            }

            it("can inject a mock view") {
                var module = createTestModule()
                let mockView = MockView()
                module.injectMock(view: mockView)

                //Assert new injected dependencies
                let v = module.view
                let p = module.presenter
                let r = module.router

                expect(v is MockView) == true
                expect(v._presenter is SamplePresenter) == true
                expect(p._view is MockView) == true
                expect(r._view is MockView) == true
            }

            it("can inject a mock presenter") {
                var module = createTestModule()
                let mockPresenter = MockPresenter(container: Container())
                module.injectMock(presenter: mockPresenter)

                //Assert new injected dependencies
                let v = module.view
                let i = module.interactor
                let p = module.presenter
                let r = module.router

                expect(p is MockPresenter) == true
                expect(p._view is SampleView) == true
                expect(p._interactor is SampleInteractor) == true
                expect(p._router is SampleRouter) == true
                expect(r._presenter is MockPresenter) == true
                expect(v._presenter is MockPresenter) == true
                expect(i._presenter is MockPresenter) == true
            }

            it("can inject a mock interactor") {
                var module = createTestModule()
                let mockInteractor = MockInteractor(container: Container())
                module.injectMock(interactor: mockInteractor)

                let i = module.interactor
                let p = module.presenter

                expect(i is MockInteractor) == true
                expect(i._presenter is SamplePresenter) == true
                expect(p._interactor is MockInteractor) == true
            }

            it("can inject a mock router") {
                var module = createTestModule()
                let mockRouter = MockRouter(container: Container())
                module.injectMock(router: mockRouter)

                let p = module.presenter
                let r = module.router

                expect(r is MockRouter) == true
                expect(r._presenter is SamplePresenter) == true
                expect(p._router is MockRouter) == true
            }

            it("can be created from nib") {
                let module = createTestModule(module: .xibModule)
                expect(module.view is XibModuleView) == true
            }

            it("can be created by code") {
                let module = createTestModule(module: .codeModule)
                expect(module.view is CodeModuleView) == true
            }

            it("builds a module by default") {
                let module = TestCleanModules.sample.build(bundle: testBundle, deviceType: .phone)
                expect(module.view is SampleView) == true
            }

            it("deinits") {
                let container = Container()
                var module: Module! = createTestModule()

                var viewIsDeallocated = false
                var mockView: MockView! = MockView()
                mockView.deinitCalled = { viewIsDeallocated = true }
                module.injectMock(view: mockView)
                mockView = nil

                var presenterIsDeallocated = false
                var mockPresenter: MockPresenter! = MockPresenter(container: container)
                mockPresenter.deinitCalled = { presenterIsDeallocated = true }
                module.injectMock(presenter: mockPresenter)
                mockPresenter = nil

                var interactorIsDeallocated = false
                var mockInteractor: MockInteractor! = MockInteractor(container: container)
                mockInteractor.deinitCalled = { interactorIsDeallocated = true }
                module.injectMock(interactor: mockInteractor)
                mockInteractor = nil

                var routerIsDeallocated = false
                var mockRouter: MockRouter! = MockRouter(container: container)
                mockRouter.deinitCalled = { routerIsDeallocated = true }
                module.injectMock(router: mockRouter)
                mockRouter = nil

                // Simulate deallocation
                module.injectMock(interactor: MockInteractor(container: container))
                module.injectMock(presenter: MockPresenter(container: container))
                module.injectMock(router: MockRouter(container: container))
                module.injectMock(view: UserInterface())
                module = nil

                expect(viewIsDeallocated).toEventually(beTrue())
                expect(presenterIsDeallocated).toEventually(beTrue())
                expect(interactorIsDeallocated).toEventually(beTrue())
                expect(routerIsDeallocated).toEventually(beTrue())
            }
        }
    }
}

// MARK: - Performance
class ModulePerformanceTests: XCTestCase {
    func testBuildQuickly() {
        measure {
            _ = createTestModule()
        }
    }

    func testBuildQuicklyFromSwiftUI() {
        measure {
            _ = createSwiftUIModule()
        }
    }

    func testBuildQuicklyFromSwiftUIWithEnvObject() {
        measure {
            _ = createSwiftUIModuleWithEnvironmentObject()
        }
    }
}
