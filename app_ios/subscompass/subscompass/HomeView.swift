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
    @State var index:CGFloat = 0
    @State var id:UUID
    var body: some View {
        RoundedRectangle(cornerRadius:y*height/5)
            .fill(Color.blue)
            .frame(width:x*width, height:y*height)
            .onTapGesture {
                print("tap")
                print(id)
            }
            .onLongPressGesture {
                print("long tap")
                print(id)
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
                    print(id)
                }
                .onLongPressGesture {
                    print("long tap red")
                    print(id)
                }
            )
            .overlay(RoundedRectangle(cornerRadius:y*height/10)
                .fill(Color.green)
                .frame(width:(x*width) / 5, height:(y*height) / 2.5)
                .position(x:x*(width*width*width), y:y*height * 0.5 + (y*height/4.5))
                .onTapGesture {
                    print("tap green")
                    print(id)
                }
                .onLongPressGesture {
                    print("long tap green")
                    print(id)
                }
            )
    }
}

struct Subscription: View {
    @State var x:CGFloat = UIScreen.main.bounds.width
    @State var y:CGFloat = UIScreen.main.bounds.height
    @State var height:CGFloat = 1/6
    @State var width:CGFloat = 9/10
    @State var index:CGFloat = 0
    @State var id:UUID
    var body: some View {
        subsc(index:index,id:id)
            .border(Color.red, width: 2) // debug
    }
}

struct Sarch: View {
    @State var x:CGFloat = UIScreen.main.bounds.width
    @State var y:CGFloat = UIScreen.main.bounds.height
    @State var contents:String = ""
    @FocusState var focus:Bool
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

struct A: Identifiable {
    var id = UUID()
    var name : CGFloat
}

struct HomeView: View {
    @State var x:CGFloat = UIScreen.main.bounds.width
    @State var y:CGFloat = UIScreen.main.bounds.height
    @State var height:CGFloat = 1/6
    var n = [
        A(name:0),
        A(name:1),
        A(name:2),
        A(name:3),
        A(name:4),
        A(name:5),
        A(name:6),
        A(name:7),
        A(name:8),
        A(name:9),
        A(name:10),
        A(name:11),
    ]
    var body: some View {
        Group{
            Sarch()
            ScrollView{
                ForEach(n) { num in
                    Subscription(index:num.name,id:num.id)
                }
            }
        }
    }
}
