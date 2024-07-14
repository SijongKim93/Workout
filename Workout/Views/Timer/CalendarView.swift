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
            
            ForEach(rows, id: \.self) { row in
                HStack {
                    ForEach(row, id: \.self) { date in
                        Text(date == nil ? "" : String(calendar.component(.day, from: date!)))
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .background(date == selectedDate ? Color.indigo : Color.clear)
                            .cornerRadius(8)
                            .onTapGesture {
                                if let date = date {
                                    selectedDate = date
                                }
                            }
                        
                    }
                }
            }
            
            Spacer()
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
