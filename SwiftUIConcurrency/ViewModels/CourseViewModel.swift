//
//  CourseViewModel.swift
//  SwiftUIConcurrency
//
//  Created by Ali Aghamirbabaei on 3/4/22.
//

import Foundation
import Apollo

enum FeaturedSubject: String, CaseIterable {
    case SwiftUI = "SwiftUI"
    case Design = "Design"
}

class CourseViewModel: ObservableObject {
    @Published public private(set) var courses: [Course] = []
    var featuredSubject: FeaturedSubject = FeaturedSubject.allCases.randomElement() ?? .SwiftUI
    @Published public private(set) var featuredCourses: [Course] = []
    
    private func queryCourses() async throws -> GraphQLResult<CourseQuery.Data>? {
        return await withCheckedContinuation { countinuation in
            Network.shared.apollo.fetch(query: CourseQuery(locale: "")) { result in
                switch result {
                case .success(let graphQLResult):
                    countinuation.resume(returning: graphQLResult)
                case .failure(let error):
                    if let error = error as? Never {
                        countinuation.resume(throwing: error)
                    }
                }
            }
        }
    }
    
    func fetch() async {
        do {
            let result = try await queryCourses()
            if let result = result {
                if let courseCollection = result.data?.courseCollection {
                    self.courses = process(data: courseCollection)
                    findFeaturedCourses()
                }
            }
        } catch {
            print("Error \(error)")
        }
    }
    
    private func process(data: CoursesData) -> [Course] {
        let content = CoursesCollection.init(data)
        
        return content.courses
    }
    
    private func findFeaturedCourses() {
        guard courses.count > 0 else {return}
        
        featuredCourses = courses.filter { course in
            course.subject == featuredSubject.rawValue
        }
    }
}
