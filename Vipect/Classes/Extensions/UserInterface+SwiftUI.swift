//
//  UserInterface+SwiftUI.swift
//  Vipect
//
//  Created by Saul Moreno Abril on 22/12/20.
//

import RxSwift
import RxCocoa
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

    public var disposeBag = DisposeBag()
    private var _lifeCycleObservable: BehaviorRelay<UserInterfaceLyfeCycle> = BehaviorRelay<UserInterfaceLyfeCycle>(value: .notLoaded)
    public lazy var lifeCycleObservable: Observable<UserInterfaceLyfeCycle> = {
        _lifeCycleObservable.asObservable()
    }()

    public override required init(rootView: Content) {
        super.init(rootView: rootView)
    }

    @objc required dynamic init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    open override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
        _lifeCycleObservable.accept(.viewDidLoad)
    }

    open override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        _lifeCycleObservable.accept(.viewWillAppear)
    }

    open override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        _lifeCycleObservable.accept(.viewDidAppear)
    }

    open override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        _lifeCycleObservable.accept(.viewWillDisappear)
    }

    open override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        _lifeCycleObservable.accept(.viewDidDisappear)
    }

    open func setUpView() {}
}
