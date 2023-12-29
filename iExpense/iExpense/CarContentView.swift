//
//  CarContentView.swift
//  iExpense
//
//  Created by Tima Sikorski on 29/12/2023.
//

import SwiftUI

struct CarContentView: View {
    @Environment(\.dismiss) var dismiss
    var car: Car
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [.indigo, .green], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            VStack {
                VStack {
                    Text("Make of your car is \(car.make)")
                    Text("Model of your car is \(car.model)")
                }            
                .font(.title)
                .foregroundStyle(.white)
                Button("dismiss") {
                    dismiss()
                }
            }
        }
    }
}
