//
//  EditView.swift
//  subscompass
//
//  Created by teruki on 2022/06/30.
//

import SwiftUI

struct EditView: View {
    // 表示・UI系変数
    @State var x:CGFloat = UIScreen.main.bounds.width
    @State var y:CGFloat = UIScreen.main.bounds.height
    @State var height:CGFloat = 1/12
    @State var width:CGFloat = 9/10
    @State var isOpenpriod:Bool = false
    
    
    @Binding var mode:displayMode
    @Binding var length:String
    
    // コンテンツ系変数
    @State var name:String
    @State var inc:String
    @State var url:String
    @State var beginDate:Date
    @State var priod:Int
    @State var memo:String
    @State var red:Float
    @State var green:Float
    @State var blue:Float
    @State var img:String
    @State var price:Int
    
    @FocusState var focus:Bool

    var body: some View {
        VStack{
            Form{
                Group{
                    Text("サブスク名")
                    TextEditor(text:$name)
                        .focused($focus)
                        .frame(width:x*width, height: y*height)
                    Text("発行元")
                    TextEditor(text:$inc)
                        .focused($focus)
                        .frame(width:x*width, height: y*height)
                    Text("画像")
                    TextEditor(text:$img)
                        .focused($focus)
                        .frame(width:x*width, height: y*height)
                }
                Group{
                    Text("期間")
                    RoundedRectangle(cornerRadius:y*height/5)
                        .fill(Color.white)
                        .frame(width:x*width, height: y*height)
                        .onTapGesture {
                            print("white")
                            isOpenpriod = isOpenpriod ? false : true
                        }
                        .overlay(
                            Text(getPriodString(priod: priod))
                        )
                    if isOpenpriod {
                        ForEach(PriodList) { p in
                            RoundedRectangle(cornerRadius:y*height/5)
                                .fill(Color.white)
                                .frame(width:x*width, height: y*height/2)
                                .onTapGesture {
                                    print("white")
                                    isOpenpriod = false
                                    priod = p.p
                                }
                                .overlay(
                                    Text(getPriodString(priod: p.p))
                                )
                        }
                    }
                    Text("価格")
                    TextField("", value: $price, formatter: NumberFormatter())
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .padding()
                                .keyboardType(.default)
                    DatePicker("開始日", selection: $beginDate, displayedComponents: .date)
                }
                Text("解約url")
                TextEditor(text:$url)
                    .focused($focus)
                    .frame(width:x*width, height: y*height)
                Text("メモ")
                TextEditor(text:$memo)
                    .focused($focus)
                    .frame(width:x*width, height: y*height*2)
                HStack{
                    Text("色")
                    RoundedRectangle(cornerRadius:y*height/5)
                        .fill(Color(red: Double(red)/255.0, green: Double(green)/255.0, blue: Double(blue)/255.0))
                }
                Group{
                    Text("R")
                    Slider(value: $red, in: 0...255,step: 1)
                }
                Group{
                    Text("G")
                    Slider(value: $green, in: 0...255,step: 1)
                }
                Group{
                    Text("B")
                    Slider(value: $blue, in: 0...255,step: 1)
                }
            }
            .onTapGesture {
                focus = false
            }
            HStack{
                RoundedRectangle(cornerRadius:y*height/5)
                    .fill(Color.blue)
                    .frame(width:x*width/2, height: y*height)
                    .onTapGesture {
                        print("bule")
                        mode = displayMode.home
                    }
                    .overlay(
                        Text("戻る")
                    )
                RoundedRectangle(cornerRadius:y*height/5)
                    .fill(Color.green)
                    .frame(width:x*width/2, height: y*height)
                    .onTapGesture {
                        print("green")
                        
                        // 端末に登録
                        UserDefaults.standard.set(name,forKey: "nameDB"+length)
                        UserDefaults.standard.set(inc,forKey: "incDB"+length)
                        UserDefaults.standard.set(url,forKey: "urlDB"+length)
                        UserDefaults.standard.set(DateToString(d:beginDate),forKey: "beginDateDB"+length)
                        UserDefaults.standard.set(priod,forKey: "priodDB"+length)
                        UserDefaults.standard.set(memo,forKey: "memoDB"+length)
                        UserDefaults.standard.set(length,forKey: "length"+length)
                        UserDefaults.standard.set(img,forKey: "imgDB"+length)
                        UserDefaults.standard.set(price,forKey: "priceDB"+length)
                        
                        // 背景色
                        UserDefaults.standard.set(Int(red),forKey: "redDB"+length)
                        UserDefaults.standard.set(Int(blue),forKey: "blueDB"+length)
                        UserDefaults.standard.set(Int(green),forKey: "greenDB"+length)
                        
                        if(length != "0"){
                            UserDefaults.standard.set(true,forKey: "next"+String(Int(length)!-1))
                        }
                        
                        print(UserDefaults.standard.string(forKey: "nameDB"+length)!)
                        print(length)
                        mode = displayMode.home
                    }
                    .overlay(
                        Text("変更")
                    )
            }
        }
    }
}

/*
struct EditView_Previews: PreviewProvider {
    static var previews: some View {
        EditView()
    }
}
 */
