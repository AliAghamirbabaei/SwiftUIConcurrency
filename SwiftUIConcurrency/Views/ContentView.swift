//
//  ContentView.swift
//  SwiftUIConcurrency
//
//  Created by Ali Aghamirbabaei on 2/26/22.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var courseViewModel: CourseViewModel
    @EnvironmentObject var sectionViewModel: SectionViewModel
    @StateObject var modalManager = ModalManager()
    @State private var text = ""
    
    var body: some View {
        ZStack {
            TabView {
                HomeView()
                    .environmentObject(modalManager)
                    .tabItem {
                        Image(systemName: "house")
                        Text("Learn now")
                    }
                NavigationView {
                    SectionsView()
                }
                .searchable(text: $text) {
                    ForEach(sectionViewModel.sections.prefix(3)) { section in
                        Text(section.title).searchCompletion(section.title)
                        
                    }
                }
                .onSubmit(of: .search) {
                    sectionViewModel.filterSections(for: text)
                }
                .tabItem {
                    Image(systemName: "square.stack.3d.down.right.fill")
                    Text("Sections")
                }
            }
            .task {
                await courseViewModel.fetch()
            }
            
            if modalManager.showModal {
                ModalManagerView()
                    .environmentObject(modalManager)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(CourseViewModel())
            .environmentObject(SectionViewModel())
    }
}
