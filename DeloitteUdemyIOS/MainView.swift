//
//  MainView.swift
//  DeloitteUdemyIOS
//
//  Created by nraikar on 14/12/21.
//

import SwiftUI

struct MainView: View {
    @AppStorage("loggedIn") var loggedIn:Bool = false
    var body: some View {
        if(loggedIn)
        {
            ContentView()
        }
        else
        {
            LoginView()
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
