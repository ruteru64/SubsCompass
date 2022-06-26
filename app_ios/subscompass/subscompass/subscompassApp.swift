//
//  subscompassApp.swift
//  subscompass
//
//  Created by teruki on 2022/06/25.
//

import SwiftUI

enum displayMode {
    case home
    case add
    case edit
    case detail
}

@main
struct subscompassApp: App {
    @State var mode:displayMode = displayMode.home
    var body: some Scene {
        WindowGroup {
            switch(mode){
                case displayMode.home:
                        HomeView()
                case displayMode.add:
                        HomeView()
                case displayMode.edit:
                        HomeView()
                case displayMode.detail:
                        HomeView()
            }
        }
    }
}
