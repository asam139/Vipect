//
//  UserInterface+Table.swift
//  Vipect
//
//  Created by Saul Moreno Abril on 22/12/20.
//

import UIKit

// MARK: - Default implementation for UITableViewController
open class TableUserInterface: UITableViewController, UserInterfaceProtocol {
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
