//
//  Interactor.swift
//  Vipect
//
//  Created by Saul Moreno Abril on 22/12/20.
//

public protocol InteractorProtocol: ViperComponent {
    var _presenter: PresenterProtocol! { get set }
}

open class Interactor: InteractorProtocol {
    public weak var _presenter: PresenterProtocol!

    required public init() { }
}
