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
    @State private var qrCode = UIImage()

    var body: some View {
        NavigationStack {
            Form {
                TextField("Name", text: $name)
                    .textContentType(.name)
                    .font(.title)

                TextField("Email address", text: $email)
                    .textContentType(.emailAddress)
                    .font(.title)
                    .autocapitalization(.none)
                Image(uiImage: qrCode)
                    .interpolation(.none)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
                    .contextMenu {
                        ShareLink(item: Image(uiImage: qrCode), preview: SharePreview("My QR Code", image: Image(uiImage: qrCode)))
                    }
            }
            .navigationTitle("Your code")
        }
        .onAppear(perform: updateCode)
        .onChange(of: name, updateCode)
        .onChange(of: email, updateCode)
    }

    func updateCode() {
        qrCode = generateQRCode(from: "\(name)\n\(email)")
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
