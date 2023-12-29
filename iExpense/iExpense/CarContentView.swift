//
//  CarContentView.swift
//  iExpense
//
//  Created by Tima Sikorski on 29/12/2023.
//

import SwiftUI

struct CarContentView: View {
    var car: Car
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [.indigo, .green], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            VStack {
                Text("Make of your car is \(car.make)")
                Text("Model of your car is \(car.model)")
                Image(ImageResource(name: "bmw_e39", bundle: .main))
                    .frame(width: 200, height: 200)
//                    .clipped()



            }
            .font(.title)
            .foregroundStyle(.white)
        }
        .padding()
    }
}
