//
//  MyInfoView.swift
//  Hot Prospects
//
//  Created by Tima Sikorski on 21/03/2024.
//

import SwiftUI
import CoreImage.CIFilterBuiltins

struct MyInfoView: View {
    @AppStorage("name") private var name = "Anonymus"
    @AppStorage("email") private var email = "you@yourdomain.com"

    let context = CIContext()
    let filter = CIFilter.qrCodeGenerator()

    var body: some View {
        NavigationStack {
            Form {
                TextField("Name", text: $name)
                    .textContentType(.name)
                    .font(.title)

                TextField("Email address", text: $email)
                    .textContentType(.emailAddress)
                    .font(.title)
                Image(uiImage: generateQRCode(from: "\(name)\n\(email)"))
                    .interpolation(.none)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
            }
            .navigationTitle("Your code")
        }
    }

    func generateQRCode(from string: String) -> UIImage {
        filter.message = Data(string.utf8)

        if let outputImage = filter.outputImage {
            if let cgImage = context.createCGImage(outputImage, from: outputImage.extent) {
                return UIImage(cgImage: cgImage)
            }
        }

        return UIImage(systemName: "xmark.circle") ?? UIImage()
    }
}

#Preview {
    MyInfoView()
}
