//
//  UIKitSlider.swift
//  SliderSwiftUI
//
//  Created by Светлана Сенаторова on 20.09.2022.
//

import SwiftUI

struct UIKitSlider: UIViewRepresentable {
    @Binding var targetValue: Int
    @Binding var currentValue: Double
    @Binding var alpha: Double
    
    func makeUIView(context: Context) -> UISlider {
        let slider = UISlider()
        slider.minimumValue = 0
        slider.maximumValue = 100
        slider.minimumTrackTintColor = .white
        slider.maximumTrackTintColor = .gray
        slider.addTarget(
            context.coordinator,
            action: #selector(Coordinator.sliderValueChanged),
            for: .valueChanged
        )
        return slider
    }
    
    
    func updateUIView(_ uiView: UISlider, context: Context) {
        uiView.thumbTintColor = .red.withAlphaComponent(CGFloat(alpha))
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(targetValue: $targetValue, currentValue: $currentValue, alpha: $alpha)
    }
    
}

extension UIKitSlider {
    
    class Coordinator: NSObject {
        @Binding var targetValue: Int
        @Binding var currentValue: Double
        @Binding var alpha: Double
        
        init(targetValue: Binding<Int>, currentValue: Binding<Double>, alpha: Binding<Double>) {
            self._targetValue = targetValue
            self._currentValue = currentValue
            self._alpha = alpha
        }
        
        @objc func sliderValueChanged(_ sender: UISlider) {
            currentValue = Double(sender.value)
            alpha = Double(computeScore())/100
        }
        
       func computeScore() -> Int {
            let difference = abs(targetValue - lround(currentValue))
            return 100 - difference
        }
    }
    
}

struct UIKitSlider_Previews: PreviewProvider {
    static var previews: some View {
        UIKitSlider(targetValue: .constant(99), currentValue: .constant(0), alpha: .constant(1))
    }
}

