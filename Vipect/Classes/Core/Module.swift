//
//  Module.swift
//  Vipect
//
//  Created by Saul Moreno Abril on 22/12/20.
//

import Foundation
import UIKit
import Swinject

private let kTabletSuffix = "Pad"

public protocol ViperComponent {}

public protocol ViperComponentDI: ViperComponent {
    init(container: Container)
}

// MARK: - Module
public struct Module<V: UserInterfaceProtocol, I: InteractorProtocol, P: PresenterProtocol, R: RouterProtocol> {
    public private(set) var view: V
    public private(set) var interactor: I
    public private(set) var presenter: P
    public private(set) var router: R
    
    init(view: V, interactor: I, presenter: P, router: R) {
        self.view = view
        self.interactor = interactor
        self.presenter = presenter
        self.router = router
    }

    static func build<T: ViperModule, V: UserInterfaceProtocol, I: InteractorProtocol, P: PresenterProtocol, R: RouterProtocol>(
        _ module: T.Type, container: Container = Container(), bundle: Bundle = Bundle.main, deviceType: UIUserInterfaceIdiom? = nil
    ) -> Module<V, I, P, R> {
        //Get class types
        let interactorClass = classForViperComponent(moduleName: module.viewName, component: .interactor, bundle: bundle) as! I.Type
        let presenterClass = classForViperComponent(moduleName: module.viewName, component: .presenter, bundle: bundle) as! P.Type
        let routerClass = classForViperComponent(moduleName: module.viewName, component: .router, bundle: bundle) as! R.Type

        //Allocate VIPER components
        let L = loadView(forModule: module, viewType: V.self, bundle: bundle, deviceType: deviceType)
        let I = interactorClass.init(container: container)
        let P = presenterClass.init(container: container)
        let R = routerClass.init(container: container)

        return build(view: L, interactor: I, presenter: P, router: R)
    }
}

// MARK: - Inject Mock Components for Testing
public extension Module {
    mutating func injectMock(view mockView: V) {
        view = mockView
        view._presenter = presenter
        presenter._view = view
    }

    mutating func injectMock(interactor mockInteractor: I) {
        interactor = mockInteractor
        interactor._presenter = presenter
        presenter._interactor = interactor
    }

    mutating func injectMock(presenter mockPresenter: P) {
        presenter = mockPresenter
        presenter._view = view
        presenter._interactor = interactor
        presenter._router = router
        view._presenter = presenter
        interactor._presenter = presenter
        router._presenter = presenter
    }

    mutating func injectMock(router mockRouter: R) {
        router = mockRouter
        router._presenter = presenter
        presenter._router = router
    }
}


// MARK: - Helper Methods
extension Module {
    static func loadView<T: ViperModule, V: UserInterfaceProtocol>(forModule module: T.Type, viewType: V.Type, bundle: Bundle, deviceType: UIUserInterfaceIdiom? = nil) -> V {
        let viewClass = classForViperComponent(moduleName: module.viewName, component: .view, bundle: bundle, deviceType: deviceType) as! UIViewController.Type
        let viewIdentifier = NSStringFromClass(viewClass).components(separatedBy: ".").last.safeString
        let viewName = module.viewName.uppercasedFirst

        switch module.viewType {
        case .nib:
            return viewClass.init(nibName: viewName, bundle: bundle) as! V
        case .code:
            return viewClass.init() as! V
        default:
            let sb = UIStoryboard(name: viewName, bundle: bundle)
            return sb.instantiateViewController(withIdentifier: viewIdentifier) as! V
        }
    }

    static func build<V: UserInterfaceProtocol, I: InteractorProtocol, P: PresenterProtocol, R: RouterProtocol>(
        view: V, interactor: I, presenter: P, router: R
    ) -> Module<V, I, P, R> {
        //View connections
        view._presenter = presenter

        //Interactor connections
        var interactor = interactor
        interactor._presenter = presenter

        //Presenter connections
        presenter._router = router
        presenter._interactor = interactor
        presenter._view = view

        //Router connections
        var router = router
        router._presenter = presenter
        
        return Module<V, I, P, R>(view: view, interactor: interactor, presenter: presenter, router: router)
    }
}

extension Module {
    static func classForViperComponent(moduleName: String, component: ViperComponentType, bundle: Bundle, deviceType: UIUserInterfaceIdiom? = nil) -> AnyClass? {
        let className = "\(moduleName.uppercasedFirst)\(component.rawValue.uppercasedFirst)"
        let bundleName = (bundle.infoDictionary?["CFBundleName"] as? String).safeString

        let classInBundle = "\(bundleName).\(className)".replacingOccurrences(of: "[ -]", with: "_", options: .regularExpression)

        if component == .view {
            let deviceType = deviceType ?? UIScreen.main.traitCollection.userInterfaceIdiom
            let isPad = deviceType == .pad
            if isPad, let tabletView = NSClassFromString(classInBundle + kTabletSuffix) {
                return tabletView
            }
        }

        return NSClassFromString(classInBundle)
    }
}



