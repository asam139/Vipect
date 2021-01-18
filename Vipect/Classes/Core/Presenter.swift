//
//  Presenter.swift
//  Vipect
//
//  Created by Saul Moreno Abril on 22/12/20.
//

import RxSwift

public protocol PresenterProtocol: class, ViperComponent {
    var _interactor: InteractorProtocol! { get set }
    var _view: UserInterfaceProtocol! { get set }
    var _router: RouterProtocol! { get set }

    var disposeBag: DisposeBag { get }

    func bindLyfeCycle()
    func setUpView()
    func bindWithView()
}

open class Presenter: PresenterProtocol {
    public var _interactor: InteractorProtocol!
    public weak var _view: UserInterfaceProtocol! {
        didSet {
            bindLyfeCycle()
        }
    }
    public var _router: RouterProtocol!

    public var disposeBag = DisposeBag()

    required public init() { }

    open func bindLyfeCycle() {
        _view.lifeCycleObservable.subscribe(onNext: { [weak self] value in
            if case .viewDidLoad = value {
                self?.setUpView()
            }
        }).disposed(by: disposeBag)
    }

    open func setUpView() {
        bindWithView()
    }
    open func bindWithView() {}
}
