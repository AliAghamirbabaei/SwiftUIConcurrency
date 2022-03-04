//
//  FeaturedCourseList.swift
//  SwiftUIConcurrency
//
//  Created by Ali Aghamirbabaei on 2/26/22.
//

import SwiftUI

struct FeaturedCourseList: View {
    var featuredCourses: [Course]
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 20) {
                ForEach(featuredCourses, id: \.id) { course in
                    FeaturedCourseCard(featuredCourse: course)
                        .frame(width: 252, height: 350, alignment: .center)
                }
            }
            .padding(.horizontal, 20)
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct FeaturedCourseList_Previews: PreviewProvider {
    static var previews: some View {
        FeaturedCourseList(featuredCourses: [coursePreviewData])
    }
}
