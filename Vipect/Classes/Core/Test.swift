//
//  Test.swift
//  Vipect
//
//  Created by Saúl Moreno Abril on 22/1/21.
//

import Foundation
import Swinject

protocol TViperComponent {
    init()
}

protocol TViperComponentDI: TViperComponent {
    init(container: Container)
}

protocol TViewProtocol: TViperComponentDI {
    associatedtype TPresenterApi: AnyObject
    var presenter: TPresenterApi { get set }
}

protocol TPresenterProtocol: TViperComponentDI {
    associatedtype TViewApi: AnyObject
    associatedtype TInteractorApi: AnyObject
    associatedtype TRouterApi: AnyObject
    
    var view: TViewApi { get set }
    var interactor: TInteractorApi { get set }
    var router: TRouterApi { get set }
}

protocol TInteractorProtocol: TViperComponentDI {
    associatedtype TPresenterApi: AnyObject
    
    var presenter: TPresenterApi { get set }
}

protocol TRouterProtocol: TViperComponentDI {
    associatedtype TPresenterApi: AnyObject
    
    var presenter: TPresenterApi { get set }
}

struct TModule<V: TViewProtocol, I: TInteractorProtocol, P: TPresenterProtocol, R: TRouterProtocol> {
    var view: V
    var interactor: I
    var presenter: P
    var router: R
}

extension TModule where V.TPresenterApi == P, I.TPresenterApi == P, R.TPresenterApi == P, P.TViewApi == V, P.TInteractorApi == I, P.TRouterApi == R {
    
    static func build(container: Container = Container()) -> Self<V, I, P, R> {
        var view = V()
        var interactor = I(container: container)
        var presenter = P(container: container)
        var router = R(container: container)
        
        view.presenter = presenter
        
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        
        interactor.presenter = presenter
        router.presenter = presenter
        
        return TModule(view: view, interactor: interactor, presenter: presenter, router: router)
    }
}
