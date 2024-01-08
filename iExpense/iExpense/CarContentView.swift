//
//  CarContentView.swift
//  iExpense
//
//  Created by Tima Sikorski on 29/12/2023.
//

import SwiftUI

struct CarContentView: View {
    @Environment(\.dismiss) var dismiss
    @State var cars: [Car]

    var body: some View {
        ZStack {
            LinearGradient(colors: [.indigo, .green], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            VStack {
                List {
                    ForEach($cars, id: \.self) { car in
                        Text("Make of your car is \(car.wrappedValue.make)")
                        Text("Model of your car is \(car.wrappedValue.model)")
                    }
                    .onDelete(perform: { indexSet in
                        cars.remove(atOffsets: indexSet)
                    })
                }
                .listStyle(.plain)
                Button("dismiss") {
                    dismiss()
                }
            }
        }
    }
}
