//
//  Debouncer.swift
//  hello_ios
//
//  Created by BS1002 on 1/6/24.
//

import Foundation

class Debouncer {
    static let shared = Debouncer(delay: 0.5)
    
    private var delay: TimeInterval
    private var workItem: DispatchWorkItem?

    init(delay: TimeInterval) {
        self.delay = delay
    }

    func debounce(action: @escaping () -> Void) {
        workItem?.cancel()
        workItem = DispatchWorkItem(block: action)
        DispatchQueue.main.asyncAfter(deadline: .now() + delay, execute: workItem!)
    }
}
