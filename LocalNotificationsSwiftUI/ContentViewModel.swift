//
//  ContentViewModel.swift
//  LocalNotificationsSwiftUI
//
//  Created by Игорь Сысоев on 07.03.2023.
//

import Foundation
import UserNotifications

class ContentViewModel: ObservableObject {
    @Published var message = ""
    @Published var time = Date()
    private var center = UNUserNotificationCenter.current()
    
    init() {
        requestNotification()
    }
    
    private func requestNotification() {
        center.requestAuthorization(options: [.alert, .sound, .badge])  { success, error in
            DispatchQueue.main.async {
                if success {
                    print("success")
                } else if let error = error {
                    print(error)
                }
            }
        }
    }
}
