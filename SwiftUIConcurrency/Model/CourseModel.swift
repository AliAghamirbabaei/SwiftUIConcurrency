//
//  CourseModel.swift
//  SwiftUIConcurrency
//
//  Created by Ali Aghamirbabaei on 3/4/22.
//

import Foundation

typealias CoursesData = CourseQuery.Data.CourseCollection

struct CoursesCollection: Decodable {
    let courses: [Course]
    
    init(_ coursesCollection: CoursesData?) {
        self.courses = coursesCollection?.courses.map({ course -> Course in
            Course(course)
        }) ?? []
    }
}

struct Course: Identifiable, Decodable {
    let id: String
    let publishedAt: String
    let title: String
    let subtitle: String
    let numberOfSection: Int
    let numberOfHours: Int
    let subject: String
    let colors: [String?]
    let illustration: String
    let sectionColletion: SectionColletion?
    
    init(_ course: CoursesData.Course?) {
        self.id = course?.sys.id ?? ""
        self.publishedAt = course?.sys.publishedAt ?? ""
        self.title = course?.title ?? ""
        self.subtitle = course?.subtitle ?? ""
        self.numberOfSection = course?.numberOfSections ?? 0
        self.numberOfHours = course?.numberOfHours ?? 0
        self.subject = course?.subject ?? ""
        self.colors = course?.colors ?? ["#0279FF", "#4FA3FF"]
        self.illustration = course?.illustration?.url ?? ""
        self.sectionColletion = SectionColletion(course?.sectionCollection)
    }
}

struct SectionColletion: Decodable {
    let sections: [Section]
    
    init(_ sectionColletion: CoursesData.Course.SectionCollection?) {
        self.sections = sectionColletion?.sections.map({ section -> Section in
            Section(section)
        }) ?? []
    }
    
    struct Section: Identifiable, Decodable {
        let id: String
        let title: String
        let subtitle: String
        let contant: String
        
        init(_ section: CoursesData.Course.SectionCollection.Section?) {
            self.id = section?.sys.id ?? ""
            self.title = section?.title ?? ""
            self.subtitle = section?.subtitle ?? ""
            self.contant = section?.content ?? ""
        }
    }
}
