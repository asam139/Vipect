//
//  Router.swift
//  Vipect
//
//  Created by Saul Moreno Abril on 22/12/20.
//

import UIKit
import Swinject

public protocol RouterProtocol: ViperComponentDI {
    var _presenter: PresenterProtocol! { get set }
    var _view: UserInterfaceProtocol! { get }

    func embedInNavigationController() -> UINavigationController
    func show(inWindow window: UIWindow?, embedInNavController: Bool, makeKeyAndVisible: Bool)
    func show(from: UIViewController, embedInNavController: Bool)
    func show(from containerView: UIViewController, insideView targetView: UIView)
    func present(from: UIViewController, embedInNavController: Bool, presentationStyle: UIModalPresentationStyle, transitionStyle: UIModalTransitionStyle, completion: (() -> Void)?)
    func dismiss(animated flag: Bool, completion: (() -> Void)?)
}

public extension RouterProtocol {
    var viewController: UIViewController {
        _view.viewController
    }

    func show(inWindow window: UIWindow?, embedInNavController: Bool = false, makeKeyAndVisible: Bool = true) {
        show(inWindow: window, embedInNavController: embedInNavController, makeKeyAndVisible: makeKeyAndVisible)
    }

    func show(from: UIViewController, embedInNavController: Bool = false) {
        show(from: from, embedInNavController: embedInNavController)
    }

    func present(
        from: UIViewController,
        embedInNavController: Bool = false,
        presentationStyle: UIModalPresentationStyle = .fullScreen,
        transitionStyle: UIModalTransitionStyle = .coverVertical,
        completion: (() -> Void)? = nil
    ) {
        present(
            from: from,
            embedInNavController: embedInNavController,
            presentationStyle: presentationStyle,
            transitionStyle: transitionStyle,
            completion: completion
        )
    }
    func dismiss(animated flag: Bool = true, completion: (() -> Void)? = nil) {
        dismiss(animated: flag, completion: completion)
    }
}

open class Router: RouterProtocol {
    public weak var _presenter: PresenterProtocol!
    public var _view: UserInterfaceProtocol! {
        return _presenter._view
    }
    
    private let container: Container
    
    required public init(container: Container) {
        self.container = container
    }
    
    open func embedInNavigationController() -> UINavigationController {
        return getNavigationController() ?? UINavigationController(rootViewController: viewController)
    }

    open func show(inWindow window: UIWindow?, embedInNavController: Bool = false, makeKeyAndVisible: Bool = true) {
        let view = embedInNavController ? embedInNavigationController() : viewController
        window?.rootViewController = view
        if makeKeyAndVisible {
            window?.makeKeyAndVisible()
        }
    }

    open func show(from: UIViewController, embedInNavController: Bool = false) {
        let view: UIViewController = embedInNavController ? embedInNavigationController() : viewController
        from.show(view, sender: nil)
    }

    public func show(from containerView: UIViewController, insideView targetView: UIView) {
        addAsChildView(ofView: containerView, insideContainer: targetView)
    }

    public func present(from: UIViewController, embedInNavController: Bool = false, presentationStyle: UIModalPresentationStyle = .fullScreen, transitionStyle: UIModalTransitionStyle = .coverVertical, completion: (() -> Void)? = nil) {
        let view: UIViewController = embedInNavController ? embedInNavigationController() : viewController
        view.modalTransitionStyle = transitionStyle
        view.modalPresentationStyle = presentationStyle
        from.present(view, animated: true, completion: completion)
    }

    public func dismiss(animated flag: Bool = true, completion: (() -> Void)? = nil) {
        viewController.dismiss(animated: flag, completion: completion)
    }

    
}

// MARK: - Get navigation controller helper
public extension RouterProtocol {
    func getNavigationController() -> UINavigationController? {
        guard let view = _view as? UIViewController else { return nil }
        if let nav = view.navigationController {
            return nav
        } else if let parent = view.parent {
            if let parentNav = parent.navigationController {
                return parentNav
            }
        }
        return nil
    }
}

// MARK: - Embed view in a container view
public extension RouterProtocol {
    func addAsChildView(ofView parentView: UIViewController, insideContainer containerView: UIView) {
        guard let view = _view as? UIViewController else { return }
        parentView.addChild(view)
        containerView.addSubview(view.view)
        stretchToBounds(containerView, view: view.view)
        view.didMove(toParent: parentView)
    }

    private func stretchToBounds(_ holderView: UIView, view: UIView) {
        view.translatesAutoresizingMaskIntoConstraints = false
        let pinDirections: [NSLayoutConstraint.Attribute] = [.top, .bottom, .left, .right]
        let pinConstraints = pinDirections.map { direction -> NSLayoutConstraint in
            return NSLayoutConstraint(item: view, attribute: direction, relatedBy: .equal,
                                      toItem: holderView, attribute: direction, multiplier: 1.0, constant: 0)
        }
        holderView.addConstraints(pinConstraints)
    }
}
