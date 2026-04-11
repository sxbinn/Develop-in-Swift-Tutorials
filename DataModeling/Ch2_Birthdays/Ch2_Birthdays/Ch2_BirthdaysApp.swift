//
//  Ch2_BirthdaysApp.swift
//  Ch2_Birthdays
//
//  Created by kosoobin on 4/12/26.
//

import SwiftUI
import SwiftData

@main
struct Ch2_BirthdaysApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: Friend.self)
                // Friend 타입을 저장할 거임
                // Friend.self : 값이 아니라 타입 자체를 의미
        }
    }
}
