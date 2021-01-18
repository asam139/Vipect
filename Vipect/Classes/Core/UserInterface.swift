//
//  UserInterface.swift
//  Vipect
//
//  Created by Saul Moreno Abril on 22/12/20.
//

import UIKit
import RxSwift
import RxRelay

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

    var disposeBag: DisposeBag { get }
    var lifeCycleObservable: Observable<UserInterfaceLyfeCycle> { get }

    func setUpView()
}

// MARK: - Default implementation for UIViewController
open class UserInterface: UIViewController, UserInterfaceProtocol {
    public var _presenter: PresenterProtocol!

    public var viewController: UIViewController { self }

    public var disposeBag = DisposeBag()
    private var _lifeCycleObservable: BehaviorRelay<UserInterfaceLyfeCycle> = BehaviorRelay<UserInterfaceLyfeCycle>(value: .notLoaded)
    public lazy var lifeCycleObservable: Observable<UserInterfaceLyfeCycle> = {
        _lifeCycleObservable.asObservable()
    }()

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
