//
//  LocalNotificationsSwiftUIApp.swift
//  LocalNotificationsSwiftUI
//
//  Created by Игорь Сысоев on 07.03.2023.
//

import SwiftUI

struct LocalNotificationsSwiftUIApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
