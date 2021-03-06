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
    @State var isLongtap:Bool = false
    
    @Binding var num:saveData
    @Binding var mode:displayMode
    @Binding var contents:String
    @Binding var length:String
    
    func onLongtap(){
        isLongtap = isLongtap ?false:true
    }
    
    var body: some View {
        if (!num.isDalate && (num.name.contains(contents) || contents == "")){
            RoundedRectangle(cornerRadius:y*height/5)
                .fill(Color(red: Double(num.red)/255, green: Double(num.green)/255, blue: Double(num.blue)/255))
                .frame(width:x*width, height: isLongtap ? y*height * 2 : y*height)
                .onTapGesture {
                    print("tap")
                    print(num.name)
                    length = num.length
                    mode = displayMode.detail
                }
                .onLongPressGesture {
                    onLongtap()
                    print("long tap")
                    print(num.id)
                    print("memo:"+num.memo)
                }
                .contentShape(
                    RoundedRectangle(cornerRadius: y*height/5)
                )
                .overlay(
                    URLImage(url: num.img == "" ? "https://1.bp.blogspot.com/-D2I7Z7-HLGU/Xlyf7OYUi8I/AAAAAAABXq4/jZ0035aDGiE5dP3WiYhlSqhhMgGy8p7zACNcBGAsYHQ/s1600/no_image_square.jpg" : num.img)
                        .frame(width:x*width/4 , height:y*height*2/3)
                        .cornerRadius(y*height)
                        .position(x: x*(1-(width*width)),y:y*height/2)
                        .onTapGesture {
                            print("tap")
                            print(num.name)
                            length = num.length
                            mode = displayMode.detail
                        }
                        .onLongPressGesture {
                            onLongtap()
                        }
                )
                .overlay(
                    VStack{
                        Text(num.name.prefix(5))
                        Text(DateToString(d:num.nextpriod))
                        Text(num.inc.prefix(5))
                        
                        if (isLongtap){
                            Text(num.memo)
                                .frame(width: x*width, height:y*height )
                        }
                    }
                    .foregroundColor( num.red + num.green + num.blue > 255*3/2 ? Color.black : Color.white)
                    .onTapGesture {
                        print("tap")
                        print(num.name)
                        length = num.length
                        mode = displayMode.detail
                    }
                    .onLongPressGesture {
                        onLongtap()
                    }
                )
                .overlay(RoundedRectangle(cornerRadius:y*height/10)
                    .fill(Color.red)
                    .frame(width:(x*width) / 5, height:(y*height) / 2.5)
                    .position(x:x*(width*width*width), y:y*height * 0.5 - (y*height/4.5))
                    .overlay(
                        Text("??????")
                            .frame(width:(x*width) / 5, height:(y*height) / 2.5)
                            .position(x:x*(width*width*width), y:y*height * 0.5 - (y*height/4.5))
                    )
                    .onTapGesture {
                        print("tap red")
                        print(num.id)
                        UserDefaults.standard.set(true,forKey: "isDalateDB"+num.length)
                        num.isDalate = true
                    }
                    .onLongPressGesture {
                        // ????????????????????????????????????
                        print("long tap red")
                        print(num.id)
                    }
                )
                .overlay(RoundedRectangle(cornerRadius:y*height/10)
                    .fill(Color.green)
                    .frame(width:(x*width) / 5, height:(y*height) / 2.5)
                    .position(x:x*(width*width*width), y:y*height * 0.5 + (y*height/4.5))
                    .overlay(
                        Text("??????")
                            .frame(width:(x*width) / 5, height:(y*height) / 2.5)
                            .position(x:x*(width*width*width), y:y*height * 0.5 + (y*height/4.5))
                    )
                    .onTapGesture {
                        print("tap green")
                        print(num.id)
                        length = num.length
                        mode = displayMode.edit
                    }
                    .onLongPressGesture {
                        // ????????????????????????????????????
                        print("long tap green")
                        print(num.id)
                    }
                )
        }
    }
}

struct Subscription: View {
    @State var x:CGFloat = UIScreen.main.bounds.width
    @State var y:CGFloat = UIScreen.main.bounds.height
    @State var height:CGFloat = 1/6
    @State var width:CGFloat = 9/10
    
    @Binding var num:saveData
    @Binding var mode:displayMode
    @Binding var contents:String
    @Binding var length:String
    
    var body: some View {
        if(!num.isDalate){
            subsc(num: $num,mode: $mode, contents:$contents,length: $length)
                .border(Color.red, width: 2) // debug
        }
    }
}

struct Sarch: View {
    @State var x:CGFloat = UIScreen.main.bounds.width
    @State var y:CGFloat = UIScreen.main.bounds.height
    @State var isDisplayDelate:Bool = false
    @FocusState var focus:Bool
    
    @Binding var mode:displayMode
    @Binding var n:[saveData]
    @Binding var contents:String
    
    var body: some View {
        Rectangle()
            .fill(Color(red:1.0-0.1, green:1.0-0.1, blue:1.0-0.1, opacity:1.0))
            .frame(height:y/6)
            .overlay(
                VStack{
                    HStack{
                        Spacer()
                        if(isDisplayDelate){
                            Circle()
                                .fill(Color.red)
                                .frame(width:y/20, height: y/20)
                                .onTapGesture {
                                    print("display all dalete")
                                    isDisplayDelate = false
                                }
                                .onLongPressGesture{
                                    print("all dalete")
                                    let appDomain = Bundle.main.bundleIdentifier
                                    UserDefaults.standard.removePersistentDomain(forName: appDomain!)
                                    isDisplayDelate = false
                                    for i in 0...n.count-1{
                                        n[i].isDalate = true
                                    }
                                }
                        }
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
                            .onLongPressGesture{
                                print("display all dalete")
                                isDisplayDelate = true
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
    @State var contents:String = ""
    
    @State var n = [
        saveData(length:"0", name:"0",inc: "nill",url: "https://",beginDate: StringToDate(dateValue: "2022/11/22"),priod: -1,memo: "memo",red:1,green:0, blue:0,isDalate: true,img:"",price: 0,nextpriod: Date())
    ]
    
    @Binding var mode:displayMode
    @Binding var length:String
    
    var body: some View {
        Group{
            Sarch(mode:$mode,n:$n,contents:$contents)
            ScrollView{
                ForEach($n) { num in
                    Subscription(num:num,mode:$mode, contents: $contents,length: $length)
                }
            }
            Text(mode.rawValue)
        }
    }
}
