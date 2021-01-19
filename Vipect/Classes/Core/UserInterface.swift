//
//  UserInterface.swift
//  Vipect
//
//  Created by Saul Moreno Abril on 22/12/20.
//

import UIKit

public enum UserInterfaceLyfeCycle {
    case notLoaded
    case viewWillAppear
    case viewDidAppear
    case viewDidLoad
    case viewWillDisappear
    case viewDidDisappear
}

public protocol UserInterfaceProtocol: class, ViperComponent {
    var _presenter: PresenterProtocol! { get set }
    var viewController: UIViewController { get }
}

// MARK: - Default implementation for UIViewController
open class UserInterface: UIViewController, UserInterfaceProtocol {
    public var _presenter: PresenterProtocol!

    public var viewController: UIViewController { self }

    open override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
        _presenter.viewDidLoad()
    }

    open override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        _presenter.viewWillAppear()
    }

    open override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        _presenter.viewDidAppear()
    }

    open override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        _presenter.viewWillDisappear()
    }

    open override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        _presenter.viewDidDisappear()
    }

    open func setUpView() {}
}
