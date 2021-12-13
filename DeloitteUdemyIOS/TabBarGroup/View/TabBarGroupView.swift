//
//  TabBarGroupView.swift
//  DeloitteUdemyIOS
//
//  Created by nraikar on 11/12/21.
//

import SwiftUI

struct TabBarGroupView: View {
    
    @State var images:[Image] 
    @State var tabIndex: Int = 0
    
    var body: some View {
        ZStack(alignment: .top) {
            

            TabBarGroupViewModel().getRespectiveViewForSelectedSegment(selectedSegment: tabIndex)

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

    static var images:[Image] = [Image(systemName: "house.fill"),
                                Image(systemName: "cart.fill"),
                                Image(systemName: "heart.fill"),
                                Image(systemName: "person.fill")]
    
    static var previews: some View {
        TabBarGroupView(images: images)
        
    }
}
