//
//  VisualEffectView.swift
//  hello_ios
//
//  Created by BS1002 on 1/6/24.
//

import Foundation
import SwiftUI

// Custom UIViewRepresentable for VisualEffectBlur
struct VisualEffectView: UIViewRepresentable {
    var effect: UIVisualEffect?
    func makeUIView(context: UIViewRepresentableContext<Self>) -> UIVisualEffectView { UIVisualEffectView()
    }
    func updateUIView(_ uiView: UIVisualEffectView, context: UIViewRepresentableContext<Self>) { uiView.effect = effect
    }
}
