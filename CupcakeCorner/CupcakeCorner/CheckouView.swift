//
//  CheckouView.swift
//  CupcakeCorner
//
//  Created by Tima Sikorski on 07/02/2024.
//

import SwiftUI

enum CheckoutError: Error {
    case encodeeFailed
    case failedToLoadData
}

struct CheckoutView: View {
    var order: Order

    @State private var confirmationMessage = ""
    @State private var showingConfirmation = false

    @State private var errorMessage = ""
    @State private var showingError = false

    var body: some View {
        ScrollView {
            VStack {
                AsyncImage(url: URL(string: "https://hws.dev/img/cupcakes@3x.jpg"), scale: 3) { image in
                    image
                        .resizable()
                        .scaledToFit()
                } placeholder: {
                    ProgressView()
                }
                .frame(height: 233)
                .accessibilityHidden(true)

                Text("Your total is \(order.cost, format: .currency(code: "USD"))")
                    .font(.title)

                Button("Place Order", action: {
                    placeOrderAndHandleResponse()
                })
                    .padding()
            }
            .alert("Thank you!", isPresented: $showingConfirmation) {
                Button("OK") {}
            } message: {
                Text(confirmationMessage)
            }
            .alert("Error", isPresented: $showingError) {
                Button("OK") {}
                Button("Try Again") {
                    placeOrderAndHandleResponse()
                }
            } message: {
                Text(errorMessage)
            }
        }
        .navigationTitle("Check out")
        .navigationBarTitleDisplayMode(.inline)
        .scrollBounceBehavior(.basedOnSize)
    }

    func placeOrderAndHandleResponse() {
        Task {
            do {
                try await placeOrder()
            } catch {
                switch error {
                case CheckoutError.encodeeFailed:
                    errorMessage = "Encoding failed"
                case CheckoutError.failedToLoadData:
                    errorMessage = "Failed to load data"
                default:
                    errorMessage = "Something is fishy 🐟. But we don't exactly know what."
                }

                showingError = true
            }
        }
    }

    func placeOrder() async throws {
        guard let encoded = try? JSONEncoder().encode(order) else {
            print("Failed to encode order")
            throw CheckoutError.encodeeFailed
        }

        let url = URL(string: "https://reqres.in/api/cupcakes")!
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"

        do {
            let (data, _) = try await URLSession.shared.upload(for: request, from: encoded)
            let receivedOrder = try JSONDecoder().decode(Order.self, from: data)
            confirmationMessage = "Your order for \(receivedOrder.quantity)x \(Order.types[receivedOrder.type].lowercased()) cupcakes is on its way!"
            showingConfirmation = true
        } catch {
            throw CheckoutError.failedToLoadData
        }
    }
}

#Preview {
    CheckoutView(order: Order())
}
