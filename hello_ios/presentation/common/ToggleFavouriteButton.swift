//
//  ToggleFavouriteView.swift
//  hello_ios
//
//  Created by BS1002 on 12/6/24.
//

import Foundation
import SwiftUI

struct ToggleFavouriteButton: View {
    let isFavourite: Bool
    let onToggleFavourite: () -> Void
    
    var body: some View {
        Button(action: onToggleFavourite) {
            HStack {
                Image(systemName: isFavourite ? "heart.fill": "heart")
                Text(isFavourite ? "Remove from Favourites" : "Add to Favourites")
            }
            .font(.subheadline)
            .foregroundColor(isFavourite ? .red : .blue)
            .padding(.top, 5)
        }
    }
}
