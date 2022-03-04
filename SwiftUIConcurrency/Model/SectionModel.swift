//
//  SectionModel.swift
//  SwiftUIConcurrency
//
//  Created by Ali Aghamirbabaei on 3/4/22.
//

import Foundation

typealias SectionCollectionData = SectionQuery.Data.SectionCollection

struct SectionDataColletion: Decodable {
    let sections: [SectionModel]
    
    init(_ sectionColletion: SectionCollectionData?) {
        self.sections = sectionColletion?.sections.map({ section -> SectionModel in
            SectionModel(section)
        }) ?? []
    }
    
    struct SectionModel: Identifiable, Decodable {
        let id: String
        let title: String
        var isPinned: Bool
        
        init(_ section: SectionQuery.Data.SectionCollection.Section?) {
            self.id = section?.sys.id ?? ""
            self.title = section?.title ?? ""
            self.isPinned = false
        }
    }
}
