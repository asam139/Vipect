//
//  HomeViewInput.swift
//  Vipect_Example
//
//  Created by Saul Moreno Abril on 27/12/20.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import Foundation
import RxCocoa

// MARK: - View Input

public enum HomeViewAction {
    case showSecondModule
}

public struct HomeViewInput {
    let action: Driver<HomeViewAction>
}
