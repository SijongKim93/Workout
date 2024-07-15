//
//  CalenderView.swift
//  Workout
//
//  Created by 김시종 on 7/14/24.
//

import SwiftUI

struct CalendarView: View {
    @State var selectedDate = Date()
    @State var currentMonth = Date()
    
    let calendar = Calendar.current
    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM yyyy"
        return formatter
    }()
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                HStack {
                    Button(action: {
                        currentMonth = calendar.date(byAdding: .month, value: -1, to: currentMonth) ?? currentMonth
                    }) {
                        Image(systemName: "chevron.left")
                            .padding()
                    }
                    
                    Spacer()
                    
                    Text(dateFormatter.string(from: currentMonth))
                        .font(.title)
                        .bold()
                        .padding()
                    
                    Spacer()
                    
                    Button(action: {
                        currentMonth = calendar.date(byAdding: .month, value: 1, to: currentMonth) ?? currentMonth
                    }) {
                        Image(systemName: "chevron.right")
                            .padding()
                    }
                }
                
                let daysInMonth = generateDaysInMonth(for: currentMonth)
                let rows = daysInMonth.chunked(into: 7)
                
                VStack(spacing: 4) {
                    ForEach(rows, id: \.self) { row in
                        HStack(spacing: 4) {
                            ForEach(row, id: \.self) { date in
                                ZStack {
                                    if let date = date {
                                        Circle()
                                            .fill(date == selectedDate ? Color.indigo : Color.clear)
                                            .frame(width: 40, height: 40)
                                        Text(String(calendar.component(.day, from: date)))
                                            .foregroundColor(date == selectedDate ? .white : .primary)
                                    } else {
                                        Text("")
                                            .frame(width: 40, height: 40)
                                    }
                                }
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                                .onTapGesture {
                                    if let date = date {
                                        selectedDate = date
                                    }
                                }
                            }
                        }
                    }
                }
                .frame(height: geometry.size.height * 1 / 2)
                
                Spacer()
            }
            .padding()
        }
    }
    
    func generateDaysInMonth(for date: Date) -> [Date?] {
        var days: [Date?] = []
        let range = calendar.range(of: .day, in: .month, for: date)!
        let firstDayOfMonth = calendar.date(from: calendar.dateComponents([.year, .month], from: date))!
        let firstWeekday = calendar.component(.weekday, from: firstDayOfMonth)
        
        for _ in 1..<firstWeekday {
            days.append(nil)
        }
        
        for day in range {
            if let date = calendar.date(byAdding: .day, value: day - 1, to: firstDayOfMonth) {
                days.append(date)
            }
        }
        
        while days.count % 7 != 0 {
            days.append(nil)
        }
        
        return days
    }
}

extension Array {
    func chunked(into size: Int) -> [[Element]] {
        var chunks: [[Element]] = []
        for i in stride(from: 0, to: count, by: size) {
            chunks.append(Array(self[i..<Swift.min(i + size, count)]))
        }
        return chunks
    }
}

#Preview {
    CalendarView()
}
