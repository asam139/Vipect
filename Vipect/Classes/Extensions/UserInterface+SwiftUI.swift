//
//  UserInterface+SwiftUI.swift
//  Vipect
//
//  Created by Saul Moreno Abril on 22/12/20.
//

#if canImport(SwiftUI)
import SwiftUI
#endif

@available(iOS 13.0, *)
public class HostingUserInterface<Content: View>: UIHostingController<Content>, UserInterfaceProtocol {
    public required init() {
        super.init(nibName: nil, bundle: nil)
    }

    public var _presenter: PresenterProtocol!
    public var viewController: UIViewController { self }

    public override required init(rootView: Content) {
        super.init(rootView: rootView)
    }

    @objc required dynamic init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

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
