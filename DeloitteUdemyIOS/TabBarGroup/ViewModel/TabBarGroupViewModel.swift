//
//  TabBarGroupViewModel.swift
//  DeloitteUdemyIOS
//
//  Created by nraikar on 11/12/21.
//

import Foundation
import SwiftUI

class TabBarGroupViewModel {
    let data: TabBarGroupModel
    
    public init() {
        self.data = TabBarGroupModel(segmentsList: [
            Image(systemName: "house.fill"),
            Image(systemName: "cart.fill"),
            Image(systemName: "heart.fill"),
            Image(systemName: "person.fill")
        ])
    }
    
    func getRespectiveViewForSelectedSegment(selectedSegment: Int) -> AnyView {
        switch selectedSegment {
        case 0:
            return AnyView(Text("Home"))
        case 1:
            return AnyView(Text("Wishlist"))
        case 2:
            return AnyView(Text("Cart"))
        case 3:
             return AnyView(Text("Profile.....!"))
        default:
            return AnyView(Text("Wrong selection"))
        }
    }
}
