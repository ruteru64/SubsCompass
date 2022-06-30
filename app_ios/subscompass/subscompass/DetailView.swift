//
//  DetailView.swift
//  subscompass
//
//  Created by teruki on 2022/06/30.
//

import SwiftUI

struct DetailView: View {
    // 表示・UI系変数
    @State var x:CGFloat = UIScreen.main.bounds.width * 9 / 10
    @State var y:CGFloat = UIScreen.main.bounds.height
    @State var height:CGFloat = 1/12
    @State var width:CGFloat = 9/10
    @State var length:String
    
    @Binding var mode:displayMode
    
    // 表示系
    @State var n:saveData
    
    var body: some View {
        Form{
            VStack{
                RoundedRectangle(cornerRadius:y*height/5)
                    .fill(Color.gray)
                    .frame(width:x*width, height: y*height * 2)
                    .overlay(
                        Text(n.name)
                    )
                RoundedRectangle(cornerRadius:y*height/5)
                    .fill(Color.gray)
                    .frame(width:x*width, height: y*height * 2)
                    .overlay(
                        VStack{
                            Text("現在の日数")
                            Text(String(getDiffDay(date1: n.beginDate, date2: Date()))+"日")
                            Text("開始日")
                            Text(DateToString(d:n.beginDate))
                        }
                    )
                HStack{
                    RoundedRectangle(cornerRadius:y*height/5)
                        .fill(Color.gray)
                        .frame(width:x*width/2, height: y*height * 3)
                        .overlay(
                            VStack{
                                Text("次回支払日")
                                Text(DateToString(d:Date()))
                                Text("支払い間隔")
                                Text(getPriodString(priod:n.priod))//todo
                                Text("支払い金額")
                                Text("5000"+"円") // todo
                            }
                        )
                    RoundedRectangle(cornerRadius:y*height/5)
                        .fill(Color.gray)
                        .frame(width:x*width/2, height: y*height * 3)
                        .overlay(
                            VStack{
                                Text("サブスク名")
                                Text(n.name)
                                Text("提供者")
                                Text(n.inc)
                            }
                        )
                }
                RoundedRectangle(cornerRadius:y*height/5)
                    .fill(Color.gray)
                    .frame(width:x*width, height: y*height * 2)
                    .overlay(
                        VStack{
                            Text("合計金額")
                            Text("いっぱい") // todo
                        }
                    )
                RoundedRectangle(cornerRadius:y*height/5)
                    .fill(Color.gray)
                    .frame(width:x*width, height: y*height * 2)
                    .overlay(
                        VStack{
                            Text("メモ")
                            Text(n.memo) // todo
                        }
                    )
            }
        }
        Spacer()
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
                    mode = displayMode.home
                }
                .overlay(
                    Text("変更")
                )
        }
    }
}

/*
struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView()
    }
}
*/
