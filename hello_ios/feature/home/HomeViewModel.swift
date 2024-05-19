//
//  HomeViewModel.swift
//  hello_ios
//
//  Created by BS1002 on 19/5/24.
//

import Foundation

class HomeViewModel : ObservableObject {
    @Published private(set) var count: Int = 0

    func incrementCount() {
        count += 1
    }
}
