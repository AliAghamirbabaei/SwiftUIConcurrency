//
//  FeaturedCourseCard.swift
//  SwiftUIConcurrency
//
//  Created by Ali Aghamirbabaei on 2/26/22.
//

import SwiftUI

struct FeaturedCourseCard: View {
    var body: some View {
        VStack(spacing: 8) {
            AsyncImage(url: URL(string: "https://AliAghamirbabaei.com/SwiftUI-Concurrency/Assets/SwiftUI-Combine-Cover.png")) { image in
                   image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(maxWidth: 220, alignment: .center)
            } placeholder: {
                    Rectangle()
                        .foregroundColor(.gray.opacity(0.2))
            }
            
            Text("SwiftUI Combine and Data")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .frame(maxWidth: .infinity, alignment: .leading)
                .lineLimit(2)
                .multilineTextAlignment(.leading)
            
            Text("18 sections - 3 hours")
                .font(.footnote)
                .foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.7)))
                .frame(maxWidth: .infinity, alignment: .leading)
                .lineLimit(1)
                .multilineTextAlignment(.leading)

            Text("Learn more about Combine in SwiftUI")
                .font(.footnote)
                .foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.7)))
                .frame(maxWidth: .infinity, alignment: .leading)
                .lineLimit(2)
                .multilineTextAlignment(.leading)

        }
        .padding(16)
        .frame(width: 252, height: 350, alignment: .top)
        .background(
            LinearGradient(gradient: Gradient(colors: [.blue, .purple]), startPoint: .top, endPoint: .bottomLeading)
        )
        .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
        .overlay(RoundedRectangle(cornerRadius: 30, style: .continuous)
                .stroke(Color.white.opacity(0.2), lineWidth: 0.5)
                .blendMode(.overlay))

    }
    
}

struct FeaturedChapterCard_Previews: PreviewProvider {
    static var previews: some View {
        FeaturedCourseCard()
    }
}
