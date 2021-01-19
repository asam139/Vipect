//
//  ViperModule.swift
//  Vipect
//
//  Created by Saul Moreno Abril on 22/12/20.
//

import UIKit
#if canImport(SwiftUI)
import SwiftUI
#endif
import Swinject

// MARK: - Module View Types
public enum ViperViewType {
    case swiftUI
    case storyboard
    case nib
    case code
}

// MARK: - Viper Module Protocol
public protocol ViperModule {
    var viewType: ViperViewType { get }
    var viewName: String { get }
    func build(
        container: Container,
        bundle: Bundle,
        deviceType: UIUserInterfaceIdiom?
    ) -> Module

    @available(iOS 13.0, *)
    func build<T: View, E: ObservableObject>(
        container: Container,
        bundle: Bundle,
        deviceType: UIUserInterfaceIdiom?,
        setupUI: ((PresenterProtocol) -> (T, E))
    ) -> Module

    @available(iOS 13.0, *)
    func build<T: View>(
        container: Container,
        bundle: Bundle,
        deviceType: UIUserInterfaceIdiom?,
        setupUI: ((PresenterProtocol) -> T)
    ) -> Module
}

public extension ViperModule where Self: RawRepresentable, Self.RawValue == String {

    var viewName: String { rawValue }

    func build(
        container: Container = Container(),
        bundle: Bundle = Bundle.main,
        deviceType: UIUserInterfaceIdiom? = nil
    ) -> Module {
        Module.build(self, container: container, bundle: bundle, deviceType: deviceType)
    }

    @available(iOS 13.0, *)
    func build<T: View, E: ObservableObject>(
        container: Container = Container(),
        bundle: Bundle = Bundle.main,
        deviceType: UIUserInterfaceIdiom? = nil,
        setupUI: ((PresenterProtocol) -> (T, E))
    ) -> Module {
        let components = allocateViperComponents(container: container, bundle: bundle)
        let set = setupUI(components.presenter)
        let viewUI = set.0

        let viewHost: UserInterfaceProtocol
        let envObject = set.1
        viewHost = HostingUserInterface(rootView: viewUI.environmentObject(envObject))

        return Module.build(view: viewHost, interactor: components.interactor,
                            presenter: components.presenter, router: components.router)
    }


    @available(iOS 13.0, *)
    func build<T: View>(
        container: Container = Container(),
        bundle: Bundle = Bundle.main,
        deviceType: UIUserInterfaceIdiom? = nil,
        setupUI: ((PresenterProtocol) -> T)
    ) -> Module {
        let components = allocateViperComponents(container: container, bundle: bundle)
        let viewUI = setupUI(components.presenter)
        let viewHost: UserInterfaceProtocol
        viewHost = HostingUserInterface(rootView: viewUI)

        return Module.build(view: viewHost, interactor: components.interactor,
                            presenter: components.presenter, router: components.router)
    }
}

private extension ViperModule where Self: RawRepresentable, Self.RawValue == String {
    func allocateViperComponents(
        container: Container,
        bundle: Bundle
    ) -> (interactor: InteractorProtocol, presenter: PresenterProtocol, router: RouterProtocol) {
        //Get class types
        let interactorClass = classForViperComponent(.interactor, bundle: bundle) as! InteractorProtocol.Type
        let presenterClass = classForViperComponent(.presenter, bundle: bundle) as! PresenterProtocol.Type
        let routerClass = classForViperComponent(.router, bundle: bundle) as! RouterProtocol.Type

        //Allocate VIPER components
        let interactor = interactorClass.init(container: container)
        let presenter = presenterClass.init(container: container)
        let router = routerClass.init(container: container)

        return (interactor, presenter, router)
    }
}
