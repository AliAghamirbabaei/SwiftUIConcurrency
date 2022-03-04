//
//  SwiftUIConcurrencyApp.swift
//  SwiftUIConcurrency
//
//  Created by Ali Aghamirbabaei on 2/26/22.
//

import SwiftUI

@main
struct SwiftUIConcurrencyApp: App {
    @StateObject var courseViewModel = CourseViewModel()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(courseViewModel)
        }
    }
}
