//
//  XibModuleView.swift
//  Vipect_Tests
//
//  Created by Saul Moreno Abril on 23/12/20.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import UIKit
import Vipect

// MARK: XibModuleView Class
final class XibModuleView: SplitUserInterface {
}

// MARK: - XibModuleView API
extension XibModuleView: XibModuleViewApi {
}

// MARK: - XibModuleView Viper Components API
private extension XibModuleView {
    var presenter: XibModulePresenterApi {
        return _presenter as! XibModulePresenterApi
    }
}
