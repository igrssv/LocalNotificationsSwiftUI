//
//  ContentViewModel.swift
//  LocalNotificationsSwiftUI
//
//  Created by Игорь Сысоев on 07.03.2023.
//

import Foundation

class ContentViewModel: ObservableObject {
    @Published var message = ""
    @Published var time = Date()
    
}
