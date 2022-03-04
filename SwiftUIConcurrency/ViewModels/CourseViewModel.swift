//
//  CourseViewModel.swift
//  SwiftUIConcurrency
//
//  Created by Ali Aghamirbabaei on 3/4/22.
//

import Foundation
import Apollo

class CourseViewModel: ObservableObject {
    @Published public private(set) var courses: [Course] = []
    
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
}
