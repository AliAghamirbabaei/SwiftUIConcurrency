//
//  SectionViewModel.swift
//  SwiftUIConcurrency
//
//  Created by Ali Aghamirbabaei on 3/4/22.
//

import Foundation
import Apollo

class SectionViewModel: ObservableObject {
    @Published public var sections: [SectionDataColletion.SectionModel] = []
    @Published public private(set) var filteredSections: [SectionDataColletion.SectionModel] = []

    private func querySections() async throws -> GraphQLResult<SectionQuery.Data>? {
        return await withCheckedContinuation { countinuation in
            Network.shared.apollo.fetch(query: SectionQuery()) { result in
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
            let result = try await querySections()
            if let result = result {
                if let sectionCollection = result.data?.sectionCollection {
                    self.sections = process(data: sectionCollection)
                }
            }
        } catch {
            print("Error \(error)")
        }
    }
    
    private func process(data: SectionCollectionData) -> [SectionDataColletion.SectionModel] {
        let content = SectionDataColletion.init(data)
        
        return content.sections
    }
    
    func randomizeSections() async {
        sections.shuffle()
    }
    
    func orderSectionsByPinned() {
        sections.sort {$0.isPinned && !$1.isPinned}
    }
    
    func filterSections(for text: String) {
        filteredSections = []
        let searchText = text.lowercased()
        
        sections.forEach { section in
            let searchContent = section.title
            
            if searchContent.lowercased().range(of: searchText, options: .regularExpression) != nil {
                filteredSections.append(section)
            }
        }
    }
}
