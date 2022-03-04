//
//  SectionList.swift
//  SwiftUIConcurrency
//
//  Created by Ali Aghamirbabaei on 3/4/22.
//

import SwiftUI

struct SectionList: View {
    @StateObject var sectionViewModel = SectionViewModel()
    
    var body: some View {
        List {
            ForEach(sectionViewModel.sections, id: \.id) { section in
                Text(section.title)
            }
        }
        .task {
            await sectionViewModel.fetch()
        }
        .refreshable {
            await sectionViewModel.randomizeSections()
        }
    }
}

struct SectionList_Previews: PreviewProvider {
    static var previews: some View {
        SectionList()
    }
}
