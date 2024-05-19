//
//  HomeScreen.swift
//  hello_ios
//
//  Created by BS1002 on 19/5/24.
//

import SwiftUI

struct HomeScreen: View {
    @StateObject private var viewModel = HomeViewModel()
    
    var body: some View {
        VStack {
            Spacer()
            Text("Count: \(viewModel.count)")
                .font(.title2)
                .padding()
            Spacer()
            Button(action: {
                viewModel.incrementCount()
            }) {
                Text("+")
                    .foregroundColor(.white)
                    .font(.largeTitle)
                    .padding(.all, 24)
                    .background(Color.blue)
                    .clipShape(Circle())
            }
            .padding()
        }
    }
}


struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}
