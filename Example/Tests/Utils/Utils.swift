//
//  Utils.swift
//  Vipect_Tests
//
//  Created by Saul Moreno Abril on 2/1/21.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import Vipect
import Swinject

let testBundle = Bundle(for: SampleRouter.self)

func createTestModuleWithMockPresenter(methodToTest: String) -> Module {
    var module = TestModules.sample.build(bundle: Bundle(for: SampleRouter.self))
    let mockPresenter = MockPresenter(container: Container())
    mockPresenter.methodExpected = methodToTest
    module.injectMock(presenter: mockPresenter)
    return module
}

func createTestModule(module: TestModules = .sample, forTablet: Bool = false) -> Module {
    let deviceType: UIUserInterfaceIdiom = forTablet ? .pad : .phone
    return module.build(bundle: testBundle, deviceType: deviceType)
}

func createSwiftUIModule() -> Module {
    TestModules.swiftUI.build(bundle: testBundle, deviceType: nil) { presenter in
        SwiftUIView(presenter: presenter as? SwiftUIPresenterApi)
    }
}

func createSwiftUIModuleWithEnvironmentObject() -> Module {
    TestModules.swiftUIWithEnv.build(bundle: testBundle, deviceType: nil) { presenter -> (SwiftUIWithEnvView, Settings) in
        let view = SwiftUIWithEnvView(presenter: presenter as? SwiftUIWithEnvPresenterApi)
        let settings = Settings()
        return (view, settings)
    }
}
