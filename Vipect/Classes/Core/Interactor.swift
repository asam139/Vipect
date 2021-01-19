//
//  Interactor.swift
//  Vipect
//
//  Created by Saul Moreno Abril on 22/12/20.
//

import Swinject

public protocol InteractorProtocol: ViperComponentDI {
    var _presenter: PresenterProtocol! { get set }
}

open class Interactor: InteractorProtocol {
    public weak var _presenter: PresenterProtocol!
    private let container: Container

    required public init(container: Container) {
        self.container = container
    }
}
