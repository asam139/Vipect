//
//  TableOfContentsInteractor.swift
//  Vipect_Example
//
//  Created by Saul Moreno Abril on 23/12/20.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import Foundation
import Vipect

// MARK: - TableOfContentsInteractor Class
final class TableOfContentsInteractor: Interactor {
}

// MARK: - TableOfContentsInteractor API
extension TableOfContentsInteractor: TableOfContentsInteractorApi {
}

// MARK: - Interactor Viper Components Api
private extension TableOfContentsInteractor {
    var presenter: TableOfContentsPresenterApi {
        return _presenter as! TableOfContentsPresenterApi
    }
}
