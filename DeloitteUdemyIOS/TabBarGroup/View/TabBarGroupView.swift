//
//  TabBarGroupView.swift
//  DeloitteUdemyIOS
//
//  Created by nraikar on 11/12/21.
//

import SwiftUI

struct TabBarGroupView: View {
    
    @State var images:[Image] = TabBarGroupViewModel().data.segmentsList
    @State var tabIndex: Int = 0
    @State var contentTabs:[AnyView]
    
    var body: some View {
        ZStack(alignment: .center) {
            
            // Page Content
//            TabBarGroupViewModel().getRespectiveViewForSelectedSegment(selectedSegment: tabIndex)
//
            ForEach(contentTabs.indices) { i in
                if i == self.tabIndex {
                    self.contentTabs[i]
                }
            }
            // TAB BAR
            VStack {
                Spacer()
                VStack(alignment: .center, spacing: 0) {
                    Divider()
                    HStack(alignment: .center, spacing: 0) {
                        
                        Spacer()
                        ForEach(images.indices) { i in
                            
                            if i == self.tabIndex {
                                self.images[i]
                                    .foregroundColor(Color.white)
                                    .onTapGesture {
                                        self.tabIndex = i
                                    }
                            } else {
                                self.images[i]
                                    .foregroundColor(Color(hue: 1.0, saturation: 0.0, brightness: 0.42))
                                    .onTapGesture {
                                        self.tabIndex = i
                                    }
                            }
                            Spacer()
                        }
                    }
                   
                    .padding(.top, 20)
                    .padding(.bottom, 40)
                    
                    
                }
                .background(Color.orange)
                .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: -2)
                
            }.edgesIgnoringSafeArea(.bottom)
        }
        
    }
}

struct TabBarGroupView_Previews: PreviewProvider {

    static var images:[Image] = TabBarGroupViewModel().data.segmentsList
    
    static var previews: some View {
        TabBarGroupView(images: images, tabIndex: 0,contentTabs: [
            AnyView(Text("Home")),
            AnyView(Text("Cart")),
            AnyView(Text("Favorites")),
            AnyView(Text("Profile"))
        ])
    }
}
