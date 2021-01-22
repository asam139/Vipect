//
//  CoolView.swift
//  Vipect_Example
//
//  Created by Saul Moreno Abril on 23/12/20.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import SwiftUI
import Vipect

//MARK: CoolView SwiftUI
struct CoolView : View {
    weak var presenter: CoolPresenterApi?
    @EnvironmentObject var settings: UserSettings
    
    var body: some View {
        VStack(spacing: 10) {
            Text(/*@START_MENU_TOKEN@*/"Hello World!"/*@END_MENU_TOKEN@*/)
            Text("SwiftUI is really amazing")
            Text("Random name: \(settings.randomName)")
            Text("Score: \(settings.score)")
            
            Button(action: { self.presenter?.changeScore() }) {
                Text("Add score +1")
            }
            Button(action: { self.presenter?.changeRandomName() }) {
                Text("Fetch new random name")
            }
            Button(action: { self.presenter?.showAnotherModule() }) {
                Text("Show another SwiftUI module")
            }
        }
    }
}
