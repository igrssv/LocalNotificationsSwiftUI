//
//  ContentView.swift
//  LocalNotificationsSwiftUI
//
//  Created by Игорь Сысоев on 07.03.2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var vm =  ContentViewModel()
    var body: some View {
        VStack(spacing: 16) {
            HStack {
                TextField("Text message", text: $vm.message)
                    .padding(10)
                    .background(.gray.opacity(0.1))
                    .cornerRadius(20)
                DatePicker("", selection: $vm.time, displayedComponents: .hourAndMinute)
            }
            Button {
                
            } label: {
                Text("Send")
                    .padding(10)
                    .frame(maxWidth: .infinity)
                    .background(.blue.opacity(0.8))
                    .cornerRadius(20)
                    .foregroundColor(.black)
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
