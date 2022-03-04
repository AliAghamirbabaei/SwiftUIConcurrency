//
//  CouseList.swift
//  SwiftUIConcurrency
//
//  Created by Ali Aghamirbabaei on 2/26/22.
//

import SwiftUI

struct CouseList: View {
    var courses: [Course]
    var columns = [GridItem(.adaptive(minimum: 160), spacing: 15)]
    var body: some View {
        LazyVGrid(columns: columns, spacing: 15) {
            ForEach(courses, id: \.id) { course in
                CourseCard(course: course)
            }
//            if courses.count > 0 {
//                ForEach(courses, id: \.id) { course in
//                    CourseCard(course: course)
//                }
//            }else {
//                ForEach(0..<4, id: \.self) { number in
//                    CourseCard(course: coursePreviewData)
//                        .redacted(reason: .placeholder )
//                }
//            }
        }
        .padding(.horizontal, 20)
    }
}

struct CouseList_Previews: PreviewProvider {
    static var previews: some View {
        CouseList(courses: [coursePreviewData])
    }
}
