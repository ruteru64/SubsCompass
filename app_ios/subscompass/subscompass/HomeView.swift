//
//  HomeView.swift
//  subscompass
//
//  Created by teruki on 2022/06/25.
//

import SwiftUI

struct subsc: View {
    @State var x:CGFloat = UIScreen.main.bounds.width
    @State var y:CGFloat = UIScreen.main.bounds.height
    @State var height:CGFloat = 1/6
    @State var width:CGFloat = 9/10
    @State var num:saveData
    @State var isLongtap:Bool = false
    
    func onLongtap(){
        isLongtap = isLongtap ?false:true
    }
    
    var body: some View {
        RoundedRectangle(cornerRadius:y*height/5)
            .fill(Color.blue)
            .frame(width:x*width, height: isLongtap ? y*height * 2 : y*height)
            .onTapGesture {
                print("tap")
                print(num.name)
            }
            .onLongPressGesture {
                onLongtap()
                print("long tap")
                print(num.id)
            }
            .contentShape(
                RoundedRectangle(cornerRadius: y*height/5)
            )
            .overlay(RoundedRectangle(cornerRadius:y*height/10)
                .fill(Color.red)
                .frame(width:(x*width) / 5, height:(y*height) / 2.5)
                .position(x:x*(width*width*width), y:y*height * 0.5 - (y*height/4.5))
                .onTapGesture {
                    print("tap red")
                    print(num.id)
                }
                .onLongPressGesture {
                    // 特に処理を入れる気がない
                    print("long tap red")
                    print(num.id)
                }
            )
            .overlay(RoundedRectangle(cornerRadius:y*height/10)
                .fill(Color.green)
                .frame(width:(x*width) / 5, height:(y*height) / 2.5)
                .position(x:x*(width*width*width), y:y*height * 0.5 + (y*height/4.5))
                .onTapGesture {
                    print("tap green")
                    print(num.id)
                }
                .onLongPressGesture {
                    // 特に処理を入れる気がない
                    print("long tap green")
                    print(num.id)
                }
            )
    }
}

struct Subscription: View {
    @State var x:CGFloat = UIScreen.main.bounds.width
    @State var y:CGFloat = UIScreen.main.bounds.height
    @State var height:CGFloat = 1/6
    @State var width:CGFloat = 9/10
    @State var num:saveData
    var body: some View {
        subsc(num: num)
            .border(Color.red, width: 2) // debug
    }
}

struct Sarch: View {
    @State var x:CGFloat = UIScreen.main.bounds.width
    @State var y:CGFloat = UIScreen.main.bounds.height
    @State var contents:String = ""
    @FocusState var focus:Bool
    @Binding var mode:displayMode
    
    var body: some View {
        Rectangle()
            .fill(Color(red:1.0-0.1, green:1.0-0.1, blue:1.0-0.1, opacity:1.0))
            .frame(height:y/6)
            .overlay(
                VStack{
                    HStack{
                        Spacer()
                        Circle()
                            .fill(Color.green)
                            .frame(width:y/20, height: y/20)
                            .overlay(
                                VStack{
                                    Spacer()
                                    Text("+")
                                        .foregroundColor(Color.white)
                                        .font(Font.system(size: y/20).bold())
                                    Spacer()
                                }
                            )
                            .onTapGesture {
                                mode = displayMode.add
                                print("add")
                            }
                    }
                    Form{
                        TextEditor(text:$contents)
                            .focused($focus)
                            .frame(width:x*9/10, height:y/32)
                    }
                    .onAppear {
                        UITableView.appearance().isScrollEnabled = false
                    }
                    .onTapGesture {
                        focus = false
                    }
                }
            )
    }
}

struct HomeView: View {
    @State var x:CGFloat = UIScreen.main.bounds.width
    @State var y:CGFloat = UIScreen.main.bounds.height
    @State var height:CGFloat = 1/6
    @Binding var mode:displayMode
    @State var n = [
        saveData(length:"0", name:"0",inc: "nill",url: "https://",beginDate: StringToDate(dateValue: "2022/11/22"),priod: 0,memo: "memo"),
    ]
    var body: some View {
        Group{
            Sarch(mode:$mode)
            ScrollView{
                ForEach(n) { num in
                    Subscription(num:num)
                }
            }
            Text(mode.rawValue)
        }
    }
}
