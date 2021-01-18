//
//  CodeModuleView.swift
//  Vipect_Tests
//
//  Created by Saul Moreno Abril on 23/12/20.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import UIKit
import Vipect

// MARK: CodeModuleView Class
final class CodeModuleView: CollectionUserInterface {
}

// MARK: - CodeModuleView API
extension CodeModuleView: CodeModuleViewApi {
}

// MARK: - CodeModuleView Viper Components API
private extension CodeModuleView {
    var presenter: CodeModulePresenterApi {
        return _presenter as! CodeModulePresenterApi
    }
}
