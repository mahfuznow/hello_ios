//
//  Debouncer.swift
//  hello_ios
//
//  Created by BS1002 on 1/6/24.
//

import Foundation

class Debouncer {
    static let shared = Debouncer(delay: 0.5)
    
    private var timer: Timer?
    
    private var delay: TimeInterval
    
    init(delay: TimeInterval) {
        self.delay = delay
    }
    
    func debounce(action: @escaping () -> Void) {
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: delay, repeats: false) { _ in
            action()
        }
    }
}
