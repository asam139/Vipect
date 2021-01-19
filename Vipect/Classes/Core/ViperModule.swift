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
    func build(bundle: Bundle, deviceType: UIUserInterfaceIdiom?) -> Module

    @available(iOS 13.0, *)
    func build<T: View, E: ObservableObject>(bundle: Bundle, deviceType: UIUserInterfaceIdiom?, setupUI: ((PresenterProtocol) -> (T, E))) -> Module

    @available(iOS 13.0, *)
    func build<T: View>(bundle: Bundle, deviceType: UIUserInterfaceIdiom?, setupUI: ((PresenterProtocol) -> T)) -> Module
}

public extension ViperModule where Self: RawRepresentable, Self.RawValue == String {

    var viewName: String {
        return rawValue
    }

    func build(bundle: Bundle = Bundle.main, deviceType: UIUserInterfaceIdiom? = nil) -> Module {
        return Module.build(self, bundle: bundle, deviceType: deviceType)
    }

    @available(iOS 13.0, *)
    func build<T: View, E: ObservableObject>(bundle: Bundle = Bundle.main, deviceType: UIUserInterfaceIdiom? = nil, setupUI: ((PresenterProtocol) -> (T, E))) -> Module {
        let components = allocateViperComponents(bundle: bundle)
        let set = setupUI(components.presenter)
        let viewUI = set.0

        let viewHost: UserInterfaceProtocol
        let envObject = set.1
        viewHost = HostingUserInterface(rootView: viewUI.environmentObject(envObject))

        return Module.build(view: viewHost, interactor: components.interactor,
                            presenter: components.presenter, router: components.router)
    }


    @available(iOS 13.0, *)
    func build<T: View>(bundle: Bundle = Bundle.main, deviceType: UIUserInterfaceIdiom? = nil, setupUI: ((PresenterProtocol) -> T)) -> Module {
        let components = allocateViperComponents(bundle: bundle)
        let viewUI = setupUI(components.presenter)
        let viewHost: UserInterfaceProtocol
        viewHost = HostingUserInterface(rootView: viewUI)

        return Module.build(view: viewHost, interactor: components.interactor,
                            presenter: components.presenter, router: components.router)
    }
}

private extension ViperModule where Self: RawRepresentable, Self.RawValue == String {
    func allocateViperComponents(bundle: Bundle) -> (interactor: InteractorProtocol, presenter: PresenterProtocol, router: RouterProtocol) {
        //Get class types
        let interactorClass = classForViperComponent(.interactor, bundle: bundle) as! InteractorProtocol.Type
        let presenterClass = classForViperComponent(.presenter, bundle: bundle) as! PresenterProtocol.Type
        let routerClass = classForViperComponent(.router, bundle: bundle) as! RouterProtocol.Type

        //Allocate VIPER components
        let interactor = interactorClass.init()
        let presenter = presenterClass.init()
        let router = routerClass.init()

        return (interactor, presenter, router)
    }
}
