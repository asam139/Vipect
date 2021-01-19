//
//  Presenter.swift
//  Vipect
//
//  Created by Saul Moreno Abril on 22/12/20.
//

public protocol PresenterProtocol: class, ViperComponent {
    var _interactor: InteractorProtocol! { get set }
    var _view: UserInterfaceProtocol! { get set }
    var _router: RouterProtocol! { get set }
    
    func viewDidLoad()
    func viewWillAppear()
    func viewDidAppear()
    func viewWillDisappear()
    func viewDidDisappear()
}

open class Presenter: PresenterProtocol {
    public var _interactor: InteractorProtocol!
    public weak var _view: UserInterfaceProtocol!
    public var _router: RouterProtocol!

    required public init() { }
    
    open func setUpView() {
        bindWithView()
    }
    open func bindWithView() {}
    
    open func viewDidLoad() {
        setUpView()
    }
    open func viewWillAppear() {}
    open func viewDidAppear() {}
    open func viewWillDisappear() {}
    open func viewDidDisappear() {}
}
