//
//  Home2View.swift
//  MeepVIPER
//
//  Created by Saul Moreno Abril on 23/12/20.
//Copyright © 2020 CocoaPods. All rights reserved.
//

import UIKit
import MeepVIPER

//MARK: Home2View Class
final class Home2View: UserInterface {
}

//MARK: - Home2View API
extension Home2View: Home2ViewApi {
}

// MARK: - Home2View Viper Components API
private extension Home2View {
    var presenter: Home2PresenterApi {
        return _presenter as! Home2PresenterApi
    }
    var displayData: Home2DisplayData {
        return _displayData as! Home2DisplayData
    }
}
