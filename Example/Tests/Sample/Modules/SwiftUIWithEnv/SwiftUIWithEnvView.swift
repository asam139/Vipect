//
//  SwiftUIWithEnvView.swift
//  Vipect_Tests
//
//  Created by Saul Moreno Abril on 23/12/20.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import SwiftUI
import Vipect

class Settings: ObservableObject {
    @Published var text = "hi"
}

// MARK: SwiftUIWithEnvView SwiftUI
struct SwiftUIWithEnvView: View {
    weak var presenter: SwiftUIWithEnvPresenterApi?
    @EnvironmentObject var settings: Settings

    var body: some View {
        Text(settings.text)
    }
}
