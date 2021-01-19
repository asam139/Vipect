//
//  RouterTests.swift
//  Vipect_Tests
//
//  Created by Saul Moreno Abril on 23/12/20.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import Quick
import Nimble
@testable import Vipect

class RouterTests: QuickSpec {
    override func spec() {
        describe("Router") {
            var module: Module!

            func createTestModule(forTablet: Bool = false) -> Module {
                let deviceType: UIUserInterfaceIdiom = forTablet ? .pad : .phone
                return TestModules.sample.build(bundle: Bundle(for: SampleRouter.self), deviceType: deviceType)
            }

            beforeEach {
                module = createTestModule()
            }

            it("has the correct properties") {
                let viewControllerFromView = module.view.viewController
                let viewControllerFromRouter = module.router.viewController

                expect(viewControllerFromView is SampleView) == true
                expect(viewControllerFromRouter is SampleView) == true
                expect(viewControllerFromView) == viewControllerFromRouter
            }

            it("can embed in navigation controller") {
                let router = module.router as! SampleRouter
                let navigationController = router.embedInNavigationController()

                expect(navigationController.viewControllers.count) == 1
                expect(navigationController.viewControllers.first is SampleView) == true
            }

            it("can embed in navigation controller when already exists") {
                let router = module.router as! SampleRouter
                let navController = UINavigationController(rootViewController: UIViewController())
                navController.pushViewController(module.view.viewController, animated: false)
                let navigationController = router.embedInNavigationController()

                expect(navigationController.viewControllers.count) == 2
                expect(navigationController.viewControllers[1] is SampleView) == true
            }

            it("can show in window") {
                let window = UIWindow()
                module.router.show(inWindow: window, embedInNavController: false, makeKeyAndVisible: false)
                expect(window.rootViewController is SampleView) == true
            }

            it("can show in window embedded in navigation controller") {
                let window = UIWindow()
                module.router.show(inWindow: window, embedInNavController: true, makeKeyAndVisible: false)

                guard let rootNav = window.rootViewController as? UINavigationController,
                      let _ = rootNav.viewControllers.first as? SampleView else {
                    fail()
                    return
                }
            }

            it("can show embedded in navigation controller") {
                let mockView = UIViewController()
                let router = module.router as! SampleRouter

                router.show(from: mockView, embedInNavController: true)
                let navigationController = module.view.viewController.navigationController

                expect(navigationController).toNot(beNil())
                expect(navigationController?.viewControllers.count) == 1
                expect(navigationController?.viewControllers.first is SampleView) == true
            }

            it("can show inside view") {
                let mockView = UIViewController()
                let targetView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
                mockView.view.addSubview(targetView)

                let router = module.router as! SampleRouter
                let tag: Int = 100
                module.view.viewController.view.tag = tag
                router.show(from: mockView, insideView: targetView)

                guard targetView.subviews.count == 1 else {
                    fail()
                    return
                }

                let extractedView = targetView.subviews.first
                expect(extractedView?.tag) == tag
            }

            it("can present") {
                let window = UIWindow()
                let mockRootModule = module!
                let rootRouter = mockRootModule.router as! SampleRouter
                let presentedModule = createTestModule()
                let presentedRouter = presentedModule.router as! SampleRouter

                // Setup window
                rootRouter.show(inWindow: window, embedInNavController: true, makeKeyAndVisible: false)

                // Setup presented view to check values afterwards
                let viewTitle = "title"
                let color = UIColor.red
                presentedModule.view.viewController.title = viewTitle
                presentedModule.view.viewController.view?.backgroundColor = color

                presentedRouter.present(from: mockRootModule.view.viewController) {
                    guard let topController = self.getTopViewController(window: window) else {
                        fail("No top ViewController found")
                        return
                    }

                    expect(topController.view?.backgroundColor) == color
                    expect(topController.title) == viewTitle
                    expect(topController) == presentedModule.view.viewController
                }
            }

            it("can present embedded in navigation controller") {
                let window = UIWindow()
                let mockRootModule = module!
                let rootRouter = mockRootModule.router as! SampleRouter
                let presentedModule = createTestModule()
                let presentedRouter = presentedModule.router as! SampleRouter

                // Setup window
                rootRouter.show(inWindow: window, embedInNavController: true, makeKeyAndVisible: false)

                presentedRouter.present(from: mockRootModule.view.viewController) {
                    // Setup presented module view to check values afterwards
                    let viewTitle = "title"
                    let color = UIColor.blue
                    presentedModule.view.viewController.title = viewTitle
                    presentedModule.view.viewController.view?.backgroundColor = color
                    presentedModule.view.viewController.navigationItem.title = viewTitle

                    guard let topNavController = self.getTopViewController(window: window) as? UINavigationController else {
                        fail("No top navigation controller found")
                        return
                    }

                    let presentedRootController = topNavController.topViewController
                    expect(presentedRootController).toNot(beNil())
                    expect(presentedRootController?.view?.backgroundColor) == color
                    expect(presentedRootController?.title) == viewTitle
                    expect(presentedRootController?.navigationItem.title) == viewTitle
                    expect(topNavController.viewControllers.count) == 1
                    expect(presentedRootController) == presentedModule.view.viewController
                }
            }

            it("can dismiss modal") {
                let window = UIWindow()
                let mockRootModule = module!
                let rootRouter = mockRootModule.router as! SampleRouter
                let presentedModule = createTestModule()
                let presentedRouter = presentedModule.router as! SampleRouter

                // Setup window
                rootRouter.show(inWindow: window, embedInNavController: false, makeKeyAndVisible: false)

                presentedRouter.present(from: mockRootModule.view.viewController) {
                    expect(mockRootModule.view.viewController.presentedViewController) == presentedModule.view.viewController
                }

                presentedRouter.dismiss(animated: false, completion: {
                    expect(mockRootModule.view.viewController.presentedViewController).to(beNil())
                })
            }
        }
    }
}


// MARK: - Helpers
private extension RouterTests {
    func getTopViewController(window: UIWindow) -> UIViewController? {
        if var topController = window.rootViewController {
            while let presentedViewController = topController.presentedViewController {
                topController = presentedViewController
            }

            return topController
        }
        return nil
    }
}
