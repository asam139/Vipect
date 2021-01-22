//
//  AppModules.swift
//  Vipect_Example
//
//  Created by Saul Moreno Abril on 23/12/20.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import Foundation
import Vipect

//MARK: - Application modules
enum AppModules: String, ViperModule {
    case tableOfContents
    case home
    case second
    case third
    case simple
    case cool

    var viewType: ViperViewType {
        switch self {
        case .tableOfContents: return .code
        case .home, .second: return .storyboard
        case .third: return .nib
        case .simple: return .code
        case .cool: return .swiftUI
        }
    }
}
