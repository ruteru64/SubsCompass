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
                    HomeView(mode: $mode)
                case displayMode.add:
                    HomeView(mode: $mode)
                case displayMode.edit:
                    HomeView(mode: $mode)
                case displayMode.detail:
                    HomeView(mode: $mode)
            }
        }
    }
}
