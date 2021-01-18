//
//  TestModules.swift
//  Vipect_Tests
//
//  Created by Saul Moreno Abril on 23/12/20.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import Vipect

enum TestModules: String, ViperModule {
    case sample
    case codeModule
    case xibModule
    case swiftUI
    case swiftUIWithEnv

    var viewType: ViperViewType {
        switch self {
        case .swiftUI, .swiftUIWithEnv: return .swiftUI
        case .codeModule: return .code
        case .xibModule: return .nib
        default: return .storyboard
        }
    }
}
