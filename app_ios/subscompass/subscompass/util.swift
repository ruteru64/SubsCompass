//
//  util.swift
//  subscompass
//
//  Created by teruki on 2022/06/29.
//

import Foundation

func StringToDate(dateValue: String) -> Date {
    let dateFormatter = DateFormatter()
    dateFormatter.calendar = Calendar(identifier: .gregorian)
    dateFormatter.dateFormat = "yyyy/MM/dd"
    return dateFormatter.date(from: dateValue) ?? Date()
}

func DateToString(d:Date) -> String{
    let dateFormatter = DateFormatter()
    dateFormatter.locale = Locale(identifier: "ja_JP")
    dateFormatter.dateStyle = .medium
    dateFormatter.dateFormat = "yyyy/MM/dd"
      
    return dateFormatter.string(from: d)
}

struct saveData: Identifiable {
    var id = UUID()
    var length:String
    var name :String
    var inc :String
    var url :String
    var beginDate:Date
    var priod:Int
    var memo:String
}
