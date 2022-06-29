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
    var red:Int
    var green:Int
    var blue:Int
    var isDalate:Bool
}

enum displayMode:String {
    case home   =   "home"
    case add    =   "add"
    case edit   =   "edit"
    case detail =   "detail"
}

enum priodMode:UInt{
    // 日間ライセンス 各数字
    case day1 = 1
    case day2 = 2
    case day3 = 3
    case day4 = 4
    case day5 = 5
    case day6 = 6
    case day30 = 30
    // 週間ライセンス 7の倍数
    case week1 = 7
    case week2 = 14
    case week3 = 21
    case week4 = 28
    // 月刊ライセンス 31の倍数
    case month1 = 31
    case month2 = 62
    case month3 = 93
    case month4 = 124
    case month6 = 186
    case month8 = 248
    case month10 = 310
    // 年間ライセンス 365の倍数
    case year1 = 365
    case year2 = 730
    // ヶ月ごとの月初課金 32の倍数
    case nextmonth1 = 32
    case nextmonth3 = 96
    case nextmonth4 = 128
    case nextmonth6 = 192
    case nextmonth12 = 384
    // 永続ライセンス 0
    case any = 0
}
