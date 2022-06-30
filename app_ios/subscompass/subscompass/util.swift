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

// 日付関係

// 日付の差分を取得
func getDiffDay(date1: Date,date2: Date) -> Int {
    let span = date2.timeIntervalSince(date1)
    return Int(span/60/60/24)
 }

enum priodMode:Int{
    // 日間ライセンス 各数字
    case day1 = 1
    case day2 = 2
    case day3 = 3
    case day4 = 4
    case day5 = 5
    case day6 = 6
    case day30 = 30
    case day365 = 365
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
    // 年間ライセンス 366の倍数
    case year1 = 366
    case year2 = 732
    // ヶ月ごとの月初課金 32の倍数
    case nextmonth1 = 32
    case nextmonth2 = 64
    case nextmonth3 = 96
    case nextmonth4 = 128
    case nextmonth6 = 192
    case nextmonth12 = 384
    // 永続ライセンス 0
    case any = 0
    // 未選択
    case no = -1
}

struct priods: Identifiable {
    var id = UUID()
    var p :Int
}



let PriodList:[priods] = [
    priods(p:priodMode.day1.rawValue),
    priods(p:priodMode.day2.rawValue),
    priods(p:priodMode.day3.rawValue),
    priods(p:priodMode.day4.rawValue),
    priods(p:priodMode.day5.rawValue),
    priods(p:priodMode.day6.rawValue),
    priods(p:priodMode.week1.rawValue),
    priods(p:priodMode.week2.rawValue),
    priods(p:priodMode.week3.rawValue),
    priods(p:priodMode.week4.rawValue),
    priods(p:priodMode.month1.rawValue),
    priods(p:priodMode.month2.rawValue),
    priods(p:priodMode.month3.rawValue),
    priods(p:priodMode.month4.rawValue),
    priods(p:priodMode.month6.rawValue),
    priods(p:priodMode.month8.rawValue),
    priods(p:priodMode.month10.rawValue),
    priods(p:priodMode.year1.rawValue),
    priods(p:priodMode.year2.rawValue),
    priods(p:priodMode.nextmonth1.rawValue),
    priods(p:priodMode.nextmonth2.rawValue),
    priods(p:priodMode.nextmonth3.rawValue),
    priods(p:priodMode.nextmonth4.rawValue),
    priods(p:priodMode.nextmonth6.rawValue),
    priods(p:priodMode.nextmonth12.rawValue),
    priods(p:priodMode.any.rawValue),
]

func getPriodString(priod:Int)->String{
    switch(priod){
    case priodMode.day1.rawValue:
        return "1日"
    case priodMode.day2.rawValue:
        return "2日"
    case priodMode.day3.rawValue:
        return "3日"
    case priodMode.day4.rawValue:
        return "4日"
    case priodMode.day5.rawValue:
        return "5日"
    case priodMode.day6.rawValue:
        return "6日"
    case priodMode.week1.rawValue:
        return "1週間"
    case priodMode.week2.rawValue:
        return "2週間"
    case priodMode.week3.rawValue:
        return "3週間"
    case priodMode.week4.rawValue:
        return "4週間"
    case priodMode.month1.rawValue:
        return "1ヶ月"
    case priodMode.month2.rawValue:
        return "2ヶ月"
    case priodMode.month3.rawValue:
        return "3ヶ月"
    case priodMode.month4.rawValue:
        return "4ヶ月"
    case priodMode.month6.rawValue:
        return "6ヶ月"
    case priodMode.month8.rawValue:
        return "8ヶ月"
    case priodMode.month10.rawValue:
        return "10ヶ月"
    case priodMode.year1.rawValue:
        return "1年"
    case priodMode.year2.rawValue:
        return "2年"
    case priodMode.nextmonth1.rawValue:
        return "月末"
    case priodMode.nextmonth2.rawValue:
        return "偶数月末"
    case priodMode.nextmonth3.rawValue:
        return "四半期末"
    case priodMode.nextmonth4.rawValue:
        return "1,5,9月末"
    case priodMode.nextmonth6.rawValue:
        return "半期末"
    case priodMode.nextmonth12.rawValue:
        return "年末"
    case priodMode.any.rawValue:
        return "永続"
    default:
        return "未選択"
    }
}
