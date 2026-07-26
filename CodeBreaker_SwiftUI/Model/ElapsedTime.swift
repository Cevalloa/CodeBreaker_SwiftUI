//
//  ElapsedTime.swift
//  CodeBreaker_SwiftUI
//
//  Created by Alex Cevallos on 7/26/26.
//

import SwiftUI

struct ElapsedTime: View {
    let startTime: Date
    let endTime: Date?

    var body: some View {
        if let endTime = endTime {
            Text(
                endTime,
                format: .offset(
                    to: startTime,
                    allowedFields: [.minute, .second]
                )
            )
        } else {
            Text(
                TimeDataSource<Date>.currentDate,
                format: .offset(
                    to: startTime,
                    allowedFields: [.minute, .second]
                )
            )
        }
    }
}

#Preview {
    //    ElapsedTime()
}
