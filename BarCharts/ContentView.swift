//
//  ContentView.swift
//  BarCharts
//
//  Created by Ali Syed on 2025-09-15.
//

import Charts
import SwiftUI

struct ContentView: View {
    
    let viewMonths: [ViewMonth] = [
        .init(date: Date.from(year: 2025, month: 1, day: 1), viewCount: 55000),
        .init(date: Date.from(year: 2025, month: 2, day: 1), viewCount: 89000),
        .init(date: Date.from(year: 2025, month: 3, day: 1), viewCount: 90000)
    ]
    
    var body: some View {
        VStack {
            Chart {
                ForEach(viewMonths) { viewMonth in
                    BarMark(
                        x: .value("Month", viewMonth.date, unit: .month),
                        y: .value("Views", viewMonth.viewCount)
                    )
                }
                .foregroundStyle(.pink.gradient)
            }
            .frame(height: 300)
            .chartXAxis {
                AxisMarks(values: viewMonths.map { $0.date }) { date in
                    AxisValueLabel(format: .dateTime.month(), centered: true)
                }
            }

        }
        .padding()
    }
}

struct ViewMonth: Identifiable {
    let id = UUID()
    let date: Date
    let viewCount: Int
}

extension Date {
    static func from(year: Int, month: Int, day: Int) -> Date {
        let components = DateComponents(year: year, month: month, day: day)
        return Calendar.current.date(from: components)!
    }
}

#Preview {
    ContentView()
}
