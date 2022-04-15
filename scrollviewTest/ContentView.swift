//
//  ContentView.swift
//  scrollviewTest
//
//  Created by dophin on 2022/4/15.
//

import SwiftUI

struct ContentView: View {
    @State var offsetIndex = 0
    @State var current_scrollOffset:CGFloat = 0.0
    @State var thetext:String = ""
    
    @State var obof:CGFloat = 0.0
    @State var obset:CGFloat = 0.0
    @StateObject var h_model:HeaderIndicatorViewmodel = HeaderIndicatorViewmodel()
    var keys:[String] = ["A","B","C","D","E"]
    var body: some View {
        VStack {
            TextField("", text: $thetext)
                .frame(width: 300, height: 30)
                .background(Color.gray)
            
            Button("click"){
                    //                scrollTarget =
                    //                h_model.selectedEventIndex = Int(thetext) ?? 0
                    //h_model.scrolloffset = Double(thetext) ?? 0.0
                
                obset = Double(thetext) ?? 0.0
                    //                current_scrollOffset = obset
            }
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing:100) {
                    ForEach (keys, id: \.self) { key in
                        HStack {
                            Text(key).minimumScaleFactor(0.5)
                        }
                        .frame(width: 100, height: 30)
                        .background(Color.green) .background((key == keys[h_model.selectedIndex]) ? Color.green : Color.clear)
                        .id(key)
                    }
                }.background(Color.blue)
                    .offset(x: current_scrollOffset + 150)
            }
            .frame(width: UIScreen.main.bounds.size.width )
            
            .background(Color.pink)
            
                //            .content.offset(x: scrollOffset)
            
            
            ScrollViewReader { proxy in
                ObservableScrollView(scrollOffset: $current_scrollOffset, setOffset: $obset, content: { proxy in
                    ZStack(alignment: .topLeading) {
                        HStack(spacing:200) {
                            ForEach(0..<keys.count + 2) { i in
                                Rectangle()
                                    .frame(width: 1, height: 10000)
                                    .background(Color.clear)
                            }
                        }.offset(x:200)
                        
                        VStack(spacing:10) {
                            HStack {
                                VStack {
                                    Text("Block1\nLine2")
                                        .lineLimit(2).minimumScaleFactor(0.5)
                                        .foregroundColor(Color.white)
                                        .id(1)
                                }
                                .padding(5)
                                .background(Color.red)
                                .frame(width: 190)
                                .position(x:200,y:50)
                                
                            }
                            .frame(height: 100)
                            .background(Color.clear)
                            
                            
                            ZStack {
                                VStack {
                                    Text("Block 2 Long Long Long Text \nLine2")
                                        .lineLimit(2).minimumScaleFactor(0.5)
                                        .foregroundColor(Color.white)
                                        .id(2)
                                }
                                .padding(5)
                                .background(Color.red)
                                .frame(width: 190)
                                .position(x:200,y:50)
                                
                                
                                Text("toPoint B ->")
                                    .font(.system(size: 10))
                                    .lineLimit(1)
                                
                                    .background(Color.white)
                                    .frame(width: 100, height: 50)
                                    .position(x:200,y:100)
                                Rectangle()
                                    .frame(width: 200, height: 1)
                                    .background(Color.brown)
                                    .position(x:300,y:150)
                                Text(" -> fromPointA")
                                    .font(.system(size: 10))
                                    .lineLimit(1)
                                    .background(Color.white)
                                    .frame(width: 100, height: 50)
                                    .position(x:400,y:100)
                                VStack {
                                    Text("Block3\nLine2")
                                        .lineLimit(2).minimumScaleFactor(0.5)
                                        .foregroundColor(Color.white)
                                        .id(3)
                                }
                                .padding(5)
                                .background(Color.red)
                                .frame(width: 190)
                                .position(x:800,y:50)
                                
                            }
                            .background(Color.clear)
                            .frame(height: 150)
                        }
                    }
                })
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
