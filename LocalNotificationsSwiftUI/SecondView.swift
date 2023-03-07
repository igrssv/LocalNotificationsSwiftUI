//
//  SecondView.swift
//  LocalNotificationsSwiftUI
//
//  Created by Игорь Сысоев on 07.03.2023.
//

import SwiftUI

struct SecondView: View {
    var titel: String
    var message: String
    @State private var show = false
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Button("Cancel") {
                    show.toggle()
                }
                .fullScreenCover(isPresented: $show) {
                    ContentView()
                }
            }
            .padding()
            Spacer()
            VStack(spacing: 20) {
                Text(titel.capitalized)
                Text(message.capitalized)
            }
            .font(.title)
            .padding()
            .frame(height: 200)
            .frame(maxWidth: .infinity)
            .background(.gray.opacity(0.6))
            .cornerRadius(24)
            .padding(30)
            Spacer()
        }
    }
}

struct SecondView_Previews: PreviewProvider {
    static var previews: some View {
        SecondView(titel: "titel", message: "message")
    }
}
