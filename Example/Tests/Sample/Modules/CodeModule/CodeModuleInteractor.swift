//
//  CodeModuleInteractor.swift
//  Vipect_Tests
//
//  Created by Saul Moreno Abril on 23/12/20.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import Foundation
import Vipect

// MARK: - CodeModuleInteractor Class
final class CodeModuleInteractor: Interactor {
}

// MARK: - CodeModuleInteractor API
extension CodeModuleInteractor: CodeModuleInteractorApi {
}

// MARK: - Interactor Viper Components Api
private extension CodeModuleInteractor {
    var presenter: CodeModulePresenterApi {
        return _presenter as! CodeModulePresenterApi
    }
}
