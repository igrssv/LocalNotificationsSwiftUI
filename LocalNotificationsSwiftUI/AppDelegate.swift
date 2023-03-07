//
//  AppDelegate.swift
//  LocalNotificationsSwiftUI
//
//  Created by Игорь Сысоев on 07.03.2023.
//

import Foundation
import UIKit
import SwiftUI

@main
class AppDelegate: NSObject, UIApplicationDelegate {
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = UIHostingController(rootView: ContentView())
        window?.makeKeyAndVisible()
        let center = UNUserNotificationCenter.current()
        center.delegate = self
        return true
    }
}

extension AppDelegate: UNUserNotificationCenterDelegate {
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.badge, .sound])
    }
    
    // Здесь мы как раз таки переопределяем вью
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        let userInfo = response.notification.request.content.userInfo
        if let viewToEnable = userInfo["notificationEvent"] as? String {
            if viewToEnable == "notification" {
                let titel = response.notification.request.content.title
                let message = response.notification.request.content.body
                let view = SecondView(titel: titel, message: message)
                let viewController = UIHostingController(rootView: view)
                let appDelegate = UIApplication.shared.delegate as! AppDelegate
                appDelegate.window?.rootViewController = viewController
            }
        }
        completionHandler()
    }
}
