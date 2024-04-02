//
//  ScrollViewPlayground.swift
//  LaidOut
//
//  Created by Tima Sikorski on 29/03/2024.
//

import SwiftUI

struct ScrollViewPlayground: View {
    var words = [
        "Incredible",
        "Astonishing",
        "Phenomenal",
        "Remarkable",
        "Extraordinary",
        "Breathtaking",
        "Fantastic",
        "Unbelievable",
        "Astounding",
        "Miraculous",
        "Marvelous",
        "Awesome",
        "Wondrous",
        "Splendid",
        "Sensational",
        "Magnificent",
        "Stupendous",
        "Stunning",
        "Jaw-dropping",
        "Awe-inspiring",
        "Sublime",
        "Unprecedented",
        "Outstanding",
        "Superb",
        "Spectacular",
        "Unimaginable",
        "Exceptional",
        "Prodigious",
        "Exquisite",
        "Electrifying",
        "Mind-blowing",
        "Thrilling",
        "Enthralling",
        "Supreme",
        "Transcendent",
        "Majestic",
        "Grand",
        "Inspiring",
        "Delightful",
        "Overwhelming",
        "Impressive",
        "Dazzling",
        "Unparalleled",
        "Peerless",
        "Formidable",
        "Incomparable",
        "Epic",
        "Monumental",
        "Bewitching",
        "Arresting",
        "Striking",
        "Radiant",
        "Glorious",
        "Captivating",
        "Mesmerizing",
        "Unmatched",
        "Unrivaled",
        "Enchanting",
        "Stirring",
        "Arousing",
        "Invigorating",
        "Riveting",
        "Resplendent",
        "Phenomenal",
        "Fabulous",
        "Unfathomable",
        "Unthinkable",
        "Unutterable",
        "Unearthly",
        "Delirious",
        "Unconceivable",
        "Superlative",
        "Unmatchable",
        "Unexampled",
        "Unimaginable",
        "Ineffable",
        "Inconceivable",
        "Unbelievable",
        "Splendorous",
        "Unanticipated",
        "Immeasurable",
        "Unthought-of",
        "Unlooked-for",
        "Unhoped-for",
        "Unspeakable",
        "Unaccountable",
        "Unimaginable",
        "Unpredictable",
        "Inscrutable",
        "Unforeseen",
        "Incomprehensible",
        "Inexplicable",
        "Unfathomed",
        "Unheard-of",
        "Unplumbed",
        "Unproducible",
        "Unrevealed",
        "Unseeable",
        "Unsolvable"
    ]

    var body: some View {
        GeometryReader { fullView in
            ScrollView(.vertical) {
                ForEach(words, id: \.self) { word in
                    GeometryReader { proxy in
                        Text(word)
                            .font(.title)
                            .frame(maxWidth: .infinity)
                            .padding(2)
                            .background(Color(hue: min(proxy.frame(in: .global).minY / fullView.size.height, 1.0), saturation: 0.8, brightness: 1))
                            .clipShape(.rect(cornerRadius: 10))
                            .rotation3DEffect(.degrees(proxy.frame(in: .global).minY - fullView.size.height / 2) / 5, axis: (x: 0, y: 1, z: 0))
                            .opacity(proxy.frame(in: .global).minY / 200)
                            .scaleEffect(getScale(scale: proxy.frame(in: .global).minY / fullView.size.height))
                    }
                    .frame(height: 30)
                }
            }
        }
    }

    func getScale(scale: CGFloat) -> CGSize {
        let adjustedScale = 0.3 + 0.7 * scale
        return CGSize(width: adjustedScale, height: 1.0)
    }
}

#Preview {
    ScrollViewPlayground()
}
