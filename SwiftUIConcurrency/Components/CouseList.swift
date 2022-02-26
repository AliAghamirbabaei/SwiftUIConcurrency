//
//  CouseList.swift
//  SwiftUIConcurrency
//
//  Created by Ali Aghamirbabaei on 2/26/22.
//

import SwiftUI

struct CouseList: View {
    var columns = [GridItem(.adaptive(minimum: 160), spacing: 15)]
    var body: some View {
        LazyVGrid(columns: columns, spacing: 15) {
            ForEach(0..<10, id: \.self) { number in
                CourseCard()
            }
        }
        .padding(.horizontal, 20)
    }
}

struct CouseList_Previews: PreviewProvider {
    static var previews: some View {
        CouseList()
    }
}
