//
//  ContentView.swift
//  SwiftUIConcurrency
//
//  Created by Ali Aghamirbabaei on 2/26/22.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var courseViewModel: CourseViewModel
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Learn now")
                }
        }
        .task {
            await courseViewModel.fetch()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
