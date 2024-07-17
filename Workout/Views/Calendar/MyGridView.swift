//
//  CalendarView2.swift
//  Workout
//
//  Created by 김시종 on 7/17/24.
//

import SwiftUI

struct MyGridView: View {
    let columns: [GridItem] = [
        GridItem(.flexible(), spacing: 6, alignment: nil),
        GridItem(.flexible(), spacing: 6, alignment: nil),
        GridItem(.flexible(), spacing: 6, alignment: nil),
        GridItem(.flexible(), spacing: 6, alignment: nil)
    ]
    
    let title: [String] = Array(1...1000).map {"목록 \($0)"}
    let layout: [GridItem] = [
        GridItem(.flexible(maximum: 80)),
        GridItem(.flexible(maximum: 80))
    ]
    
    
    var body: some View {
        ScrollView {
            Rectangle()
                .fill(Color.orange)
                .frame(height: 400)
            
            LazyVGrid(
                columns: columns,
                alignment: .center,
                spacing: 6,
                pinnedViews: [.sectionHeaders]) {
                    // Section 1
                    Section(header: Text("section1")
                        .foregroundStyle(.white)
                        .font(.title)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(Color.blue)
                        .padding()
                    ) {
                        ForEach(0..<20) { index in
                            Rectangle()
                                .fill(Color.gray)
                                .frame(height: 150)
                                .overlay(
                                    Text("\(index) 번")
                                )
                        }
                    } //: Section 1
                    
                    // Section 2
                    Section(header: Text("Section2")
                        .foregroundStyle(.white)
                        .font(.title)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(Color.green)
                        .padding()
                    ) {
                        ForEach(0..<20) { index in
                            Rectangle()
                                .fill(Color.gray)
                                .frame(height: 150)
                                .overlay(
                                    Text("\(index) 번")
                                )
                        }
                    } //: Seciton 2
                    
                    // Section 3
                    Section(header: Text("Section3")
                        .foregroundStyle(.white)
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(Color.yellow)
                        .padding()
                    ) {
                        ForEach(0..<20) { index in
                            Rectangle()
                                .fill(Color.gray)
                                .frame(height: 150)
                                .overlay(
                                    Text("\(index) 번")
                                )
                        }
                    } //: Section 3
                }
        } // : 1번 끝
        
        ScrollView(.horizontal) {
            LazyHGrid(rows: layout, spacing: 20) {
                ForEach(title, id: \.self) { item in
                    VStack {
                        Capsule()
                            .fill(Color.yellow)
                            .frame(height: 30)
                        
                        Text(item)
                            .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                    }
                }
            }
        }
    }
}

#Preview {
    MyGridView()
}
