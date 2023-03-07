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
    
    func createNotification() {
        let content = UNMutableNotificationContent()
        content.title = "LocalNotificationsSwiftUI"
        content.body = message
        content.userInfo = ["notificationEvent" : "notification"] // эти данные будем использовать в AppDelegate
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: setupDateComponent(), repeats: false)
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        
        center.add(request)
        message = ""
    }
    
    private func setupDateComponent() -> DateComponents {
        var dateComponent = DateComponents()
        dateComponent.day = Calendar.current.component(.day, from: time)
        dateComponent.hour = Calendar.current.component(.hour, from: time)
        dateComponent.minute = Calendar.current.component(.minute, from: time)
        return dateComponent
    }
}
