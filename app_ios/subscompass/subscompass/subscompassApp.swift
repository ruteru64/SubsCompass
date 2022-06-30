//
//  subscompassApp.swift
//  subscompass
//
//  Created by teruki on 2022/06/25.
//

import SwiftUI

@main
struct subscompassApp: App {
    @State var mode:displayMode = displayMode.home
    
    func getData()->[saveData]{
        if (UserDefaults.standard.string(forKey: "nameDB"+"0") == nil){
            let r:[saveData] = []
            return r
        }
        var r:[saveData] = []
        var next = true
        var i = 0
        while(next){
            if (!UserDefaults.standard.bool(forKey: "isDalateDB"+String(i))){
                let temp:saveData = saveData(
                    length: String(i),
                    name: UserDefaults.standard.string(forKey: "nameDB"+String(i))!,
                    inc: UserDefaults.standard.string(forKey: "incDB"+String(i))!,
                    url: UserDefaults.standard.string(forKey: "urlDB"+String(i))!,
                    beginDate: StringToDate(dateValue:UserDefaults.standard.string(forKey: "beginDateDB"+String(i))!),
                    priod: UserDefaults.standard.integer(forKey: "priodDB"+String(i)),
                    memo:UserDefaults.standard.string(forKey: "memoDB"+String(i))!,
                    red:UserDefaults.standard.integer(forKey: "redDB"+String(i)),
                    green: UserDefaults.standard.integer(forKey: "greenDB"+String(i)),
                    blue: UserDefaults.standard.integer(forKey: "blueDB"+String(i)),
                    isDalate: false
                )
                r += [temp]
            }
            next = UserDefaults.standard.bool(forKey: "next"+String(i))
            i += 1
        }
        return r
    }
    
    func getLength()->String{
        if (UserDefaults.standard.string(forKey: "nameDB"+"0") == nil){
            print("0")
            return "0"
        }
        var next = true
        var i = 0
        while(next){
            next = UserDefaults.standard.bool(forKey: "next"+String(i))
            i += 1
        }
        return String(i)
    }
    
    var body: some Scene {
        WindowGroup {
            switch(mode){
                case displayMode.home:
                HomeView(mode: $mode,n:getData())
                case displayMode.add:
                    // HomeView(mode: $mode)
                    AddView(mode: $mode,length: getLength())
                case displayMode.edit:
                    HomeView(mode: $mode)
                case displayMode.detail:
                    HomeView(mode: $mode)
            }
        }
    }
}
