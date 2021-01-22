//
//  HomeViewInput.swift
//  Vipect
//
//  Created by Saúl Moreno Abril on 22/1/21.
//  Copyright © 2021 CocoaPods. All rights reserved.
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
